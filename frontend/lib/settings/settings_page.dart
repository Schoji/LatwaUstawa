import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:latwe_ustawy/settings/widgets/section_button.dart';
import 'package:latwe_ustawy/settings/widgets/section_widget.dart';
import 'package:latwe_ustawy/settings/widgets/settings_fullpage.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

String rodo = """<div style="font-family: sans-serif; line-height: 1.6;">
  
  <h3>1. Podejście "Privacy First"</h3>
  <p>
    Aplikacja <strong>ŁatwaUstawa</strong> została stworzona z myślą o pełnej anonimowości użytkownika. 
    Nie wymagamy logowania, nie zakładamy kont i <strong>nie gromadzimy żadnych danych osobowych</strong>.
  </p>

  <h3>2. Jakie dane przechowujemy?</h3>
  <p>
    <strong>Żadnych.</strong> Aplikacja nie wysyła żadnych informacji o Tobie na zewnętrzne serwery. 
    Nie używamy plików cookies, trackerów reklamowych ani narzędzi analitycznych śledzących Twoją aktywność.
  </p>

  <h3>3. Źródła informacji</h3>
  <p>
    Aplikacja działa jak "przeglądarka" publicznie dostępnych danych. Pobieramy informacje w czasie rzeczywistym z:
  </p>
  <ul>
    <li>Oficjalnego API Sejmu RP (<code>api.sejm.gov.pl</code>)</li>
  </ul>
  <p>Twoje urządzenie jedynie wyświetla te dane, nie zapisując trwale historii Twoich zapytań.</p>

  <h3>4. Uprawnienia w telefonie</h3>
  <p>
    Aplikacja prosi jedynie o dostęp do <strong>Internetu</strong>, aby móc pobrać aktualną listę ustaw. 
    Nie mamy dostępu do Twojej lokalizacji, kontaktów, kamery ani plików.
  </p>

  <h3>5. Kontakt</h3>
  <p>
    Projekt jest otwartoźródłowy (Open Source). Jeśli masz pytania techniczne, skontaktuj się z naszym zespołem deweloperskim.
  </p>

</div>""";

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.outlineVariant.withAlpha(50),
            width: 1,
          ),
        ),
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              SectionWidget(
                //label: "Inne",
                children: [
                  SectionButton(
                    label: "Ochrona o danych osobowych",
                    icon: LucideIcons.shield,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => SettingsFullpage(
                            title: "Ochrona o danych osobowych",
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: colors.surfaceContainerLow,
                                    border: Border.all(
                                      color: colors.onSurfaceVariant.withAlpha(
                                        20,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [HtmlWidget(rodo)],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SectionButton(
                    label: "O aplikacji",
                    icon: LucideIcons.info,
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (context) => SettingsFullpage(
                            title: "O aplikacji",
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: colors.surfaceContainerLow,
                                    border: Border.all(
                                      color: colors.onSurfaceVariant.withAlpha(
                                        20,
                                      ),
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 6,
                                      children: [
                                        Row(
                                          spacing: 20,
                                          children: [
                                            CircleAvatar(
                                              backgroundColor:
                                                  colors.surfaceContainerLow,
                                              backgroundImage: AssetImage(
                                                "assets/icon/logo.png",
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Łatwa Ustawa",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Text(
                                                  "Wersja 1.0",
                                                  style: TextStyle(
                                                    color:
                                                        colors.onSurfaceVariant,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Twórcy:",
                                                style: TextStyle(
                                                  color:
                                                      colors.onSurfaceVariant,
                                                ),
                                              ),
                                              Text("VibingCoders"),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Rok wydania:",
                                              style: TextStyle(
                                                color: colors.onSurfaceVariant,
                                              ),
                                            ),
                                            Text("2025"),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Text(
                                            "ŁatwaUstawa to narzędzie zwiększające transparentność procesu legislacyjnego w Polsce. Naszą misją jest walka z wykluczeniem prawnym poprzez tłumaczenie skomplikowanych przepisów na prosty, zrozumiały język. Aplikacja wykorzystuje sztuczną inteligencję do analizy oficjalnych dokumentów pobieranych w czasie rzeczywistym z API Sejmu RP. Dzięki temu otrzymujesz rzetelne, obiektywne streszczenia zmian w prawie, zanim te wejdą w życie.",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
