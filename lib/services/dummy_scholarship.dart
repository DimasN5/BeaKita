import '../models/scholarship_model.dart';

List<ScholarshipModel> scholarshipList = [

  ScholarshipModel(
    title: "LPDP Scholarship",
    organization: "Kementerian Keuangan",
    deadline: "12 September 2026",
    category: "S2/S3",
    funding: "Fully Funded",
    location: "Indonesia & Overseas",

    description:
        "LPDP merupakan program beasiswa penuh dari Pemerintah Indonesia untuk jenjang Magister dan Doktor.",

    requirement:
        "IPK minimal 3.00\nMemiliki sertifikat bahasa\nLulus seleksi administrasi",

    benefit:
        "Biaya Kuliah\nUang Saku\nTiket Pesawat\nAsuransi",

    website:
        "https://lpdp.kemenkeu.go.id",
  ),

  ScholarshipModel(
    title: "Beasiswa Unggulan",
    organization: "Kemendikbud",
    deadline: "30 Agustus 2026",
    category: "S1",
    funding: "Fully Funded",
    location: "Indonesia",

    description:
        "Program beasiswa bagi mahasiswa berprestasi.",

    requirement:
        "IPK minimal 3.25\nMahasiswa aktif",

    benefit:
        "Biaya Pendidikan\nUang Saku",

    website:
        "https://beasiswaunggulan.kemdikbud.go.id",
  ),

  ScholarshipModel(
    title: "Bank Indonesia",
    organization: "Bank Indonesia",
    deadline: "18 September 2026",
    category: "S1",
    funding: "Partial",
    location: "Indonesia",

    description:
        "Program beasiswa bagi mahasiswa aktif.",

    requirement:
        "Semester 3\nIPK minimal 3.00",

    benefit:
        "Uang Saku\nLeadership Program",

    website:
        "https://www.bi.go.id",
  ),

  ScholarshipModel(
    title: "Pertamina Sobat Bumi",
    organization: "Pertamina Foundation",
    deadline: "25 September 2026",
    category: "S1",
    funding: "Fully Funded",
    location: "Indonesia",

    description:
        "Beasiswa peduli lingkungan.",

    requirement:
        "Mahasiswa aktif\nAktif organisasi",

    benefit:
        "Biaya Kuliah\nMentoring",

    website:
        "https://pertaminafoundation.org",
  ),

  ScholarshipModel(
    title: "Beasiswa Indonesia Maju",
    organization: "Kemendikbud",
    deadline: "5 Oktober 2026",
    category: "S1/S2",
    funding: "Fully Funded",
    location: "Indonesia",

    description:
        "Program pengembangan SDM Indonesia.",

    requirement:
        "Prestasi Akademik",

    benefit:
        "Biaya Pendidikan",

    website:
        "https://puslapdik.kemdikbud.go.id",
  ),

  ScholarshipModel(
    title: "Djarum Plus",
    organization: "Djarum Foundation",
    deadline: "10 Oktober 2026",
    category: "S1",
    funding: "Partial",
    location: "Indonesia",

    description:
        "Beasiswa prestasi mahasiswa.",

    requirement:
        "IPK minimal 3.20",

    benefit:
        "Dana Pendidikan",

    website:
        "https://djarumbeasiswaplus.org",
  ),

  ScholarshipModel(
    title: "Astra Scholarship",
    organization: "Astra International",
    deadline: "18 Oktober 2026",
    category: "S1",
    funding: "Partial",
    location: "Indonesia",

    description:
        "Program CSR Astra.",

    requirement:
        "Mahasiswa aktif",

    benefit:
        "Dana Pendidikan",

    website:
        "https://astra.co.id",
  ),

  ScholarshipModel(
    title: "BRI Scholarship",
    organization: "Bank Rakyat Indonesia",
    deadline: "22 Oktober 2026",
    category: "S1",
    funding: "Partial",
    location: "Indonesia",

    description:
        "Beasiswa BRI untuk mahasiswa.",

    requirement:
        "IPK minimal 3.00",

    benefit:
        "Dana Pendidikan",

    website:
        "https://bri.co.id",
  ),

  ScholarshipModel(
    title: "BCA Finance Scholarship",
    organization: "BCA Finance",
    deadline: "2 November 2026",
    category: "S1",
    funding: "Partial",
    location: "Indonesia",

    description:
        "Beasiswa mahasiswa berprestasi.",

    requirement:
        "Semester 5",

    benefit:
        "Dana Pendidikan",

    website:
        "https://bcafinance.co.id",
  ),

];

List<ScholarshipModel> get favoriteScholarships {
  return scholarshipList
      .where((item) => item.isFavorite)
      .toList();
}