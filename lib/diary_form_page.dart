import 'package:flutter/material.dart';
import 'diary.dart';
import 'diary_db.dart';

class DiaryFormPage extends StatefulWidget {
  final Diary? diary;
  const DiaryFormPage({super.key, this.diary});

  @override
  State<DiaryFormPage> createState() => _DiaryFormPageState();
}

class _DiaryFormPageState extends State<DiaryFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  bool get isEdit => widget.diary != null;

  @override
  void initState() {
    super.initState();
    if (isEdit) {
      _titleController.text = widget.diary!.title;
      _contentController.text = widget.diary!.content;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _saveDiary() async {
    if (!_formKey.currentState!.validate()) return;

    final diary = Diary(
      id: widget.diary?.id,
      title: _titleController.text.trim(),
      content: _contentController.text.trim(),
      createdAt: DateTime.now(),
    );

    if (isEdit) {
      await DiaryDb.instance.update(diary);
    } else {
      await DiaryDb.instance.insert(diary);
    }

    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildGradientAppBar(),
      body: Stack(
        children: [
          /// ================= BACKGROUND IMAGE =================
          Positioned.fill(
            child: Image.asset(
              'assets/images/edit.jpg',
              fit: BoxFit.cover,
            ),
          ),

          /// ================= DARK OVERLAY =================
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.45),
            ),
          ),

          /// ================= FORM =================
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Form(
                          key: _formKey,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              // 🌸 PINK SUPER TRANSPARAN
                              color: isEdit
                                  ? const Color(0xFFFFC1D9).withOpacity(0.35)
                                  : Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(22),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 14,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                /// ================= TITLE =================
                                Text(
                                  isEdit ? 'Edit Diary' : 'Tambah Diary',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF6A1B9A),
                                  ),
                                ),

                                const SizedBox(height: 24),

                                /// ================= JUDUL =================
                                TextFormField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                    labelText: 'Judul',
                                    prefixIcon: const Icon(Icons.title),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.85),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Judul wajib diisi'
                                          : null,
                                ),

                                const SizedBox(height: 16),

                                /// ================= ISI DIARY =================
                                TextFormField(
                                  controller: _contentController,
                                  maxLines: 6,
                                  decoration: InputDecoration(
                                    labelText: 'Isi Diary',
                                    alignLabelWithHint: true,
                                    prefixIcon: const Icon(Icons.edit_note),
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.85),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                          ? 'Isi diary wajib diisi'
                                          : null,
                                ),

                                const Spacer(),

                                /// ================= BUTTON =================
                                ElevatedButton(
                                  onPressed: _saveDiary,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFD81B60),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: const Text(
                                    'Simpan Diary',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// ================= GRADIENT APP BAR =================
  PreferredSizeWidget _buildGradientAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 4,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFFD81B60),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      title: Text(
        isEdit ? 'Edit Diary' : 'Tambah Diary',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
