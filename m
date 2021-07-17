Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C078BC636CA
	for <linux-remoteproc@archiver.kernel.org>; Sat, 17 Jul 2021 23:49:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A30BE61042
	for <linux-remoteproc@archiver.kernel.org>; Sat, 17 Jul 2021 23:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhGQXwJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 17 Jul 2021 19:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbhGQXwI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 17 Jul 2021 19:52:08 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9911EC061762;
        Sat, 17 Jul 2021 16:49:10 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id w13so8007629wmc.3;
        Sat, 17 Jul 2021 16:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oBGFOtNXdJtGI6zllMRiYFqQMCyuJWzibZ62ST2fM4g=;
        b=UoPI9cT/aV3KiC2ZkWQlM9k6+BLn38/hBCBIZz7MioThojHAnTr+pGzZhxMUBCOZKj
         p/XxcdsnrF666N5PRAIvK5wKermUMtxgJs61Cve/RbUWk6f96Lv10nrl0fH89OkW88wX
         gBkcnpr0BvT5dA1er5ltGAEEd7ZAy//vdpI42rkzXXoON9gU4BGQt0Eo98RpbaigOQI1
         gV0V+R5peeh9nx2eGDhoFLSfUo0fsBpy1YF5y7jYKJIbG5D0uRDo5UDSGeG14IyBDmNU
         ZOagbeDpsfrQb7JNR0AorIcz5aJ6VfuGd+OCmgOzdK2h4V0gKLOwCjGPNV410DXTkLQ7
         5E8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oBGFOtNXdJtGI6zllMRiYFqQMCyuJWzibZ62ST2fM4g=;
        b=qIndK6uFB0kg4UJSUaxTRTAqHgNdBQSzPpOv1hz9actRBfFmbAUk/Sjt0z5uRY0X5r
         mu8jekAYr16qE/Elmk/Z+CMpnOuysvyabNl34sft7PVso02o1uh6SZGhScT+llWcjAXO
         ujIfN9b+R1zAzNh6w9zQrqAicFUSZuPK2gXqoqSwMonruLw3mLW3RYH1fmwWWd5B7xce
         mThxn+i0pw4FY0XMK6K3kBD950BU1mwRGlTrm0yl6pK/NQvP89DO8dYfpY6lOYLuEZoL
         tbZDSqIURkwKEl/ZoIbSOJ/Z6NBUO9YgJgY+rfs73D0wClvb9jqbztz1VaTuyqJvVp1G
         RABg==
X-Gm-Message-State: AOAM533jItAMGAy6qZetnffppy6d+6J0CvvJ9z19mbb3Urn3JJ1jcOcr
        eX/gS+aZ5dveQNqZKYQe+nxEDxKHBl4=
X-Google-Smtp-Source: ABdhPJy36kFbyqTdwDVbP5vyf9GTdh9YsWISuX1CjkkH15Qo0Aioai9FsOghz8lU4/JioPvCA9HUKA==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr25267205wmc.105.1626565749059;
        Sat, 17 Jul 2021 16:49:09 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c22-7602-4e00-f22f-74ff-fe21-0725.c22.pool.telefonica.de. [2a01:c22:7602:4e00:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id p11sm14505044wro.78.2021.07.17.16.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 16:49:08 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        ohad@wizery.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 0/2] Amlogic Meson Always-On ARC remote-processor support
Date:   Sun, 18 Jul 2021 01:48:57 +0200
Message-Id: <20210717234859.351911-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
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

Changes since v2 at [2]:
- added Rob's Reviewed-by to the dt-bindings patch (thank you!)
- all other patches (secbus2 dt-bindings, .dtsi, etc.) are already
  applied so they're not part of this series anymore
- remove extra indentation for register fields
- fix maximum (da + len) check in meson_mx_ao_arc_rproc_da_to_va to not
  exceed the allocated SRAM size (thanks for spotting this Bjorn!)
- remove extra usleep_range from meson_mx_ao_arc_rproc_start
- make the code to generate the value for the AO_CPU_CNTL register
  easier to read
- removed unused secbus2_pdev variable from meson_mx_ao_arc_rproc_probe
- add preprocessor defines for the AO_REMAP_REG0 and AO_REMAP_REG1
  fields. Special thanks to Jianxin from Amlogic for providing this
  information
- program AO_REMAP_REG0 correctly so bits 17:14 in the SRAM address can
  be used
- program AO_REMAP_REG1 with 0x0 and add a comment as to why this is
  needed. This comment should also clarify why the da_to_va
  implementation can assume that the memory always starts at 0x0
- allow bits 17:14 to be set in the SRAM address. I tested this with
  physical address 0xd9010000 (SRAM offset 0x10000)
- re-reading the Amlogic u-boot and kernel code again made me understand
  what the bits in AO_SECURE_REG0 are used for: these need to be
  programmed with bits [19:12] of the used SRAM address. The field macro
  and GENMASK is updated accordingly.
- initialize fw_name with NULL so we can simplify the code as we don't
  have to check for the return value of device_property_read_string
  anymore (thanks for the suggestion Bjorn)
- drop of_match_ptr as it's not needed (thanks for the suggestion Bjorn)
- add the new is_iomem parameter to the .da_to_va implementation


[0] https://github.com/xdarklight/zephyr-rtos/commits/amlogic_ao_em4-20201229
[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=407349
[2] https://patchwork.kernel.org/project/linux-amlogic/cover/20210102205904.2691120-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
  remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote
    procesor

 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  87 ++++++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/meson_mx_ao_arc.c          | 260 ++++++++++++++++++
 4 files changed, 359 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
 create mode 100644 drivers/remoteproc/meson_mx_ao_arc.c

-- 
2.32.0

