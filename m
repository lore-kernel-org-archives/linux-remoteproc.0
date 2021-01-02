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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8323C433E0
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:01:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99D77207A1
	for <linux-remoteproc@archiver.kernel.org>; Sat,  2 Jan 2021 21:01:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726699AbhABVAf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 2 Jan 2021 16:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbhABU76 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 2 Jan 2021 15:59:58 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C8BCC0613C1;
        Sat,  2 Jan 2021 12:59:17 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id 6so31447622ejz.5;
        Sat, 02 Jan 2021 12:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZXTaInf+Yo5LsKCyI11wuDAzV+8zs5s3fKU7mcWEjLM=;
        b=iMtMm8AENs9yq4HSoLVRH5uCuHA4CxeZ7ZjC6hsG46JVXFGIggBgB1Chn/sx83BQDB
         EifmK1hdCuB5Zf2++3WS7V5cs2jOIwFblHALQnONN69vTDSE+1wsqhkLIV3zHsrVMjYS
         R+aKPeLJGUBw6u5eYuPHVrFonNMaLvdxRtkeBQ/jEpGNOewxWC1CgJ2q4iixzxvUzwu2
         zN774PybVeaky+S46eAzr2xs+AHbWsUAL5tv2qs0br7YcekHnpH00dQSXGc1rF4qeU2E
         n95MoM3+vjAh92+OLyYcjp91QsKh6g1TqrHgdU6z2kC4SN5LEN8BovBs8B9WmAJ9Xa6a
         M+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZXTaInf+Yo5LsKCyI11wuDAzV+8zs5s3fKU7mcWEjLM=;
        b=Lkk0nX4qbx7+vsriw/GK0kxZlmAvcGVybHUEY/Kf8gO+j7MNDAyheF83RXqEdj1zHS
         sMT0UoegFnMMPlmgjHFMPRyX0zZIh/UCdXcKNOxhLc3uKwu4pzRvTaMj7CgkOOoq4E1D
         YquqW/hJOdMv1iSTjU0AZdgQvPcxKXsdWpSug865pmpmwEumcUbXC7Mi89gsbH+8RBYn
         OGpfvsZ3eu8+rqeYibwMjo5L3TIy1mgP63+2X9pobfeGMCvXvWxRcseVFzXqN0+SyGI4
         hvbOM4Swn/yXUPyVDYsIDhNr+y70cQ5IX5UzQAka0Wf8jeFUo8hTJPGdEXuLCmItC1Ha
         dRcQ==
X-Gm-Message-State: AOAM532NcH5OzAfg4iQpxmZshBwP5eHzUYqnWKaAInsu5TCGTHWguB69
        plRCDtfKKn4a/oCVUkczWoL91Gq5/Xc=
X-Google-Smtp-Source: ABdhPJzosbgg4ui+GXvaroIAhnbnYvuiBqMtlxkx3Df4uX6nAlSVLgQ1IV+RkkHV0fcRbc7EjNG/7A==
X-Received: by 2002:a17:906:9250:: with SMTP id c16mr62319967ejx.355.1609621155067;
        Sat, 02 Jan 2021 12:59:15 -0800 (PST)
Received: from localhost.localdomain (p200300f13724fd00428d5cfffeb99db8.dip0.t-ipconnect.de. [2003:f1:3724:fd00:428d:5cff:feb9:9db8])
        by smtp.googlemail.com with ESMTPSA id v18sm41420617edx.30.2021.01.02.12.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:59:14 -0800 (PST)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     ohad@wizery.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/5] Amlogic Meson Always-On ARC remote-processor support
Date:   Sat,  2 Jan 2021 21:58:59 +0100
Message-Id: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
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


Changes since v1 at [1]:
- fixed yamllint warnings (after installing the package these now also
  show up on my build machine) in patches #2 and #3. Thanks for the
  hint Rob
- dropped the explicit "select" statement from the dt-bindings in patch
  #2 as suggested by Rob (thanks)


[0] https://github.com/xdarklight/zephyr-rtos/commits/amlogic_ao_em4-20201229
[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=407349


Martin Blumenstingl (5):
  dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
  dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
  dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
  remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote
    procesor
  ARM: dts: meson: add the AO ARC remote processor

 .../arm/amlogic/amlogic,meson-mx-secbus2.yaml |  42 +++
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  87 +++++++
 .../devicetree/bindings/sram/sram.yaml        |   2 +
 arch/arm/boot/dts/meson.dtsi                  |   7 +
 arch/arm/boot/dts/meson8.dtsi                 |  21 ++
 arch/arm/boot/dts/meson8b.dtsi                |  21 ++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/meson_mx_ao_arc.c          | 240 ++++++++++++++++++
 9 files changed, 432 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-mx-secbus2.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
 create mode 100644 drivers/remoteproc/meson_mx_ao_arc.c

-- 
2.30.0

