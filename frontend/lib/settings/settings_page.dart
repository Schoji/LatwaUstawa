import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(18)),color: Colors.blueGrey),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,    
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      onTap: () {
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                        child: Row(
                          spacing: 14,
                          children: [
                            Icon(LucideIcons.palette, size: 26,),
                            Text("Wygląd", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 5, thickness: 1, indent: 56),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      onTap: () {
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                        child: Row(
                          spacing: 14,
                          children: [
                            Icon(LucideIcons.shield, size: 26,),
                            Text("Ochrona danych osobowych", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 5, thickness: 1, indent: 56),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                        onTap: () {
                          
                        },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                        child: Row(
                          spacing: 14,
                          children: [
                            Icon(LucideIcons.info, size: 26,),
                            Text("O aplikacji", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
