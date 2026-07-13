require('dotenv').config();
const mongoose = require('mongoose');
const Scholarship = require('./models/Scholarship');

const scholarships = [
  {
    title: "LPDP Scholarship",
    organization: "Kementerian Keuangan",
    deadline: new Date("2026-09-12"),
    category: "S2/S3",
    funding: "Fully Funded",
    location: "Indonesia & Overseas",
    description: "LPDP merupakan program beasiswa penuh dari Pemerintah Indonesia untuk jenjang Magister dan Doktor.",
    requirement: "IPK minimal 3.00\nMemiliki sertifikat bahasa\nLulus seleksi administrasi",
    benefit: "Biaya Kuliah\nUang Saku\nTiket Pesawat\nAsuransi",
    website: "https://lpdp.kemenkeu.go.id",
  },
  {
    title: "Beasiswa Unggulan",
    organization: "Kemendikbud",
    deadline: new Date("2026-08-30"),
    category: "S1",
    funding: "Fully Funded",
    location: "Indonesia",
    description: "Program beasiswa bagi mahasiswa berprestasi.",
    requirement: "IPK minimal 3.25\nMahasiswa aktif",
    benefit: "Biaya Pendidikan\nUang Saku",
    website: "https://beasiswaunggulan.kemdikbud.go.id",
  },
  {
    title: "Bank Indonesia",
    organization: "Bank Indonesia",
    deadline: new Date("2026-09-18"),
    category: "S1",
    funding: "Partial",
    location: "Indonesia",
    description: "Program beasiswa bagi mahasiswa aktif.",
    requirement: "Semester 3\nIPK minimal 3.00",
    benefit: "Uang Saku\nLeadership Program",
    website: "https://www.bi.go.id",
  },
  {
    title: "Pertamina Sobat Bumi",
    organization: "Pertamina Foundation",
    deadline: new Date("2026-09-25"),
    category: "S1",
    funding: "Fully Funded",
    location: "Indonesia",
    description: "Beasiswa peduli lingkungan.",
    requirement: "Mahasiswa aktif\nAktif organisasi",
    benefit: "Biaya Kuliah\nMentoring",
    website: "https://pertaminafoundation.org",
  },
  {
    title: "Beasiswa Indonesia Maju",
    organization: "Kemendikbud",
    deadline: new Date("2026-10-05"),
    category: "S1/S2",
    funding: "Fully Funded",
    location: "Indonesia",
    description: "Program pengembangan SDM Indonesia.",
    requirement: "Prestasi Akademik",
    benefit: "Biaya Pendidikan",
    website: "https://puslapdik.kemdikbud.go.id",
  },
  {
    title: "Djarum Plus",
    organization: "Djarum Foundation",
    deadline: new Date("2026-10-10"),
    category: "S1",
    funding: "Partial",
    location: "Indonesia",
    description: "Beasiswa prestasi mahasiswa.",
    requirement: "IPK minimal 3.20",
    benefit: "Dana Pendidikan",
    website: "https://djarumbeasiswaplus.org",
  },
  {
    title: "Astra Scholarship",
    organization: "Astra International",
    deadline: new Date("2026-10-18"),
    category: "S1",
    funding: "Partial",
    location: "Indonesia",
    description: "Program CSR Astra.",
    requirement: "Mahasiswa aktif",
    benefit: "Dana Pendidikan",
    website: "https://astra.co.id",
  },
  {
    title: "BRI Scholarship",
    organization: "Bank Rakyat Indonesia",
    deadline: new Date("2026-10-22"),
    category: "S1",
    funding: "Partial",
    location: "Indonesia",
    description: "Beasiswa BRI untuk mahasiswa.",
    requirement: "IPK minimal 3.00",
    benefit: "Dana Pendidikan",
    website: "https://bri.co.id",
  },
  {
    title: "BCA Finance Scholarship",
    organization: "BCA Finance",
    deadline: new Date("2026-11-02"),
    category: "S1",
    funding: "Partial",
    location: "Indonesia",
    description: "Beasiswa mahasiswa berprestasi.",
    requirement: "Semester 5",
    benefit: "Dana Pendidikan",
    website: "https://bcafinance.co.id",
  },
];

async function seed() {
  try {
    await mongoose.connect(process.env.MONGODB_URI);
    console.log('MongoDB connected');

    await Scholarship.deleteMany({});
    console.log('Existing scholarships cleared');

    await Scholarship.insertMany(scholarships);
    console.log(`${scholarships.length} scholarships seeded`);

    await mongoose.disconnect();
    console.log('Done');
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
}

seed();
