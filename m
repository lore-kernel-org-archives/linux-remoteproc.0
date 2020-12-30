Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D240C43381
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8C3E21D1B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 30 Dec 2020 01:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgL3B2X (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 29 Dec 2020 20:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgL3B2X (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Dec 2020 20:28:23 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8674CC061799;
        Tue, 29 Dec 2020 17:27:42 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id cw27so14155542edb.5;
        Tue, 29 Dec 2020 17:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARDULvl3K+7mKmorfNn+FGZREJqQZbCok3NrkDyimB8=;
        b=ZcuNfiQHvJIMcXrTtox5laXU3Dx9NrLtrwcrB8xthQmGlTCzsc+kLmv76rvWh1SAJJ
         tSCo/HmXcaoS7VhbUProe6Pd7m5ZIPJK1xC/eUauojnlQ0bIOnNg3PPrTjjhytxi4wGA
         AYW/Jo/eZ00etEXLXudPuzWry6D9jxg8lsfC3kBARM7ScnB+dG6CQw9foMJPYoXD2N7O
         J4flPQCnGLZoDth8IzuygGGyrAawwJewuoCaofKA67lDuKDmj3jVekEs9oXIBhLLbtMp
         qBrtvhZuCMovXa4brw2q1G2Hn6y6PKdkIkVeTCkjGLnp2jbEqVRR3FJKLITp7iyoB5m6
         jI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ARDULvl3K+7mKmorfNn+FGZREJqQZbCok3NrkDyimB8=;
        b=X3W5wYlE724dLEV0TSuMGvkPHX9dDVqia1i8r2k9FK9UBd0KQM9k1H+X7/h52BTARE
         3n1DIt4XSD1rqhBez2MdkmGd2v9Mkvu7/Oeuz9c5ChLHPpgXrAZApFBUy66yez2ee915
         Dm3a28ZLL13QgpLW++t0Bdy9rLijFoA5TSZyNv9dKfniUzJphMs9E10x8rYaRbZNPRfr
         dX8a9mNhucL9lxNArf7agGIpkrRd5XSO0FoXE1Z+ufGnDun8WtQFby2c7aVhEV04OnHr
         8jMEcEMjNlXgJgdpKWzbANaH3vweUsd1RMee+PjogybCjEZMefLBkOxy4QA4H2f8vTpP
         sT2g==
X-Gm-Message-State: AOAM531zrYCsou/MKIS2S47mv5Y/Mx7v13U98/0G4MseFASUBLZeE6CA
        7c6hnQ9Hw4noKhhR/MsZjp4vaS76Jcw=
X-Google-Smtp-Source: ABdhPJza+dkuhISoCbq9Ju6Frs/urZxRvLH025K73xoTWyGduYLzL9TNOLz0Tk2zCYERiB5KWDuxjA==
X-Received: by 2002:a50:875b:: with SMTP id 27mr49390011edv.24.1609291661131;
        Tue, 29 Dec 2020 17:27:41 -0800 (PST)
Received: from localhost.localdomain (p200300f1372a4000428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:372a:4000:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id f20sm26576696edx.92.2020.12.29.17.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Dec 2020 17:27:40 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
        ohad@wizery.com, robh+dt@kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/5] Amlogic Meson Always-On ARC remote-processor support
Date:   Wed, 30 Dec 2020 02:27:19 +0100
Message-Id: <20201230012724.1326156-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Amlogic Meson6/8/8b/8m2 come with an ARC core in the Always-On (AO)
power-domain. This is typically used for waking up the ARM CPU after
powering it down for system suspend.

The exact ARC core used on Meson6 and earlier is not known. I believe
it is an ARC625, but I am not sure about this. Meson8/8b/8m2 uses an
ARC EM4 core.
They all have in common that they use a section of the SoCs SRAM for
running code on the ARC core.

Unfortunately there's no information about the remote-processor control
registers in the public Meson8b (S805) datasheet. All information is
either taken from Amlogic's 3.10 kernel and 2011-03 u-boot or found by
testing (for example the clock input is not mentioned anywhere in the
reference code, but disabling it stops the AO ARC core from working).

This series consists of five patches:
 1: dt-bindings for the SRAM section
 2: dt-bindings for the SECBUS2 syscon region which contains a few
    bits for controlling this remote processor
 3: dt-bindings for the AO ARC remote processor
 4: the driver for booting code on the AO ARC remote processor
 5: (only included for documentation purposes) dts changes (these will
    be re-sent separately)

Patches #3 and #4 should go through the remoteproc tree. Patches #1
and #2 may go through Rob's (devicetree) tree, Kevin's linux-amlogic
tree or through the remoteproc tree. Personally I have no preference
here.

To test this series I ported the Amlogic serial driver and added the
board files for the Amlogic AO ARC EM4 to the Zephyr RTOS. The code can
be found here: [0] (the resulting zephyr.elf can then be loaded as
remote-processor firmware from Linux).


[0] https://github.com/xdarklight/zephyr-rtos/commits/amlogic_ao_em4-20201229


Martin Blumenstingl (5):
  dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
  dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
  dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
  remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote
    procesor
  ARM: dts: meson: add the AO ARC remote processor

 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml |  53 ++++
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  87 +++++++
 .../devicetree/bindings/sram/sram.yaml        |   2 +
 arch/arm/boot/dts/meson.dtsi                  |   7 +
 arch/arm/boot/dts/meson8.dtsi                 |  21 ++
 arch/arm/boot/dts/meson8b.dtsi                |  21 ++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/meson_mx_ao_arc.c          | 240 ++++++++++++++++++
 9 files changed, 443 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
 create mode 100644 drivers/remoteproc/meson_mx_ao_arc.c

-- 
2.30.0

