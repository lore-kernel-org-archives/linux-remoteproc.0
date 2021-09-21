Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FCFC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 19:26:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0914360F4C
	for <linux-remoteproc@archiver.kernel.org>; Tue, 21 Sep 2021 19:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234483AbhIUT1t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Sep 2021 15:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbhIUT1j (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Sep 2021 15:27:39 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECD4C061756;
        Tue, 21 Sep 2021 12:26:10 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t7so9171043wrw.13;
        Tue, 21 Sep 2021 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M44k/EQ5RVp2yV+FZ63Q3mCrPnRwPKMhbcxeLAftlN4=;
        b=bweWDEWDgqV7R6EumEFd5vNnTKlTBbyYJ2DHQCzg5wb8m47z/V1BmAcKMllzSJjlI1
         cd67qGVsUjp+j9j+pgZNVkYVHy9pMgxN03BByXq/DDiIAZshSzSJZ/iMuuF2M4KBVfKf
         oLLCHYkj3WekIPsjZvYBL6VqJ6K3yNWXYVXb2VJC86HkSKAy3sEk00ogh5/6d1ViH/+6
         ZhejDnINkH3WfBiJLUyzaSdR6Baw3QF0vTWs8ktG9Bt+ldBGUxyJExGbuAEfY/ahER8n
         N6aglGdOrBgsq3n+OlWGEPcf/EQQ0Y9tY8x7avCVVJvViq2ekjhE/FezjicObvA3VadS
         j0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M44k/EQ5RVp2yV+FZ63Q3mCrPnRwPKMhbcxeLAftlN4=;
        b=4JpHSxs8SNWYTuK9CPbIv1GxQe5r/V+P44V78dTMOzBt4o+lmItH98LKpsFp4B8bPO
         srcIpgZ7q8HNR9yM97cKhYdLgj8hKAsToWBAiCobZqwLNHGSVzpqctoqcnSvwfPXCu+5
         1MrfMmEQsneepQFys6T3WK8sqc34Z6ow0b9jwbmeF3ItKTCPHvpIQWv4Ppl8pLAN4uLo
         XCZDyJz8rDA7UZXmfgBJIjAqesVQ7IrAJICHFmgAGEGBEIjtqkHz8wP5bPbH591d1bVV
         QhpGX4dalEFIGmcH0vMLN9Owv4zSG5J1SfugyWv2pBz9ggkdIvC4JVGIRdLR8xPvjht+
         k4Bg==
X-Gm-Message-State: AOAM531hM5Bs2wTDDagCSP+DBqRfD6DB2YMBmAKWro5SlEvO0u4+89Ez
        rfwxMQ/jdoJliGZec2XzufsLQ49EGl8=
X-Google-Smtp-Source: ABdhPJzHXP8AcOpgY33+bQhi4pgiyZbRt+mZNlNVSYZUpT54FOogKTy2Libt6XIg4Jf9JkaD3rjyxQ==
X-Received: by 2002:a05:6000:1284:: with SMTP id f4mr37470100wrx.88.1632252368869;
        Tue, 21 Sep 2021 12:26:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a01-0c23-c4aa-d500-f22f-74ff-fe21-0725.c23.pool.telefonica.de. [2a01:c23:c4aa:d500:f22f:74ff:fe21:725])
        by smtp.googlemail.com with ESMTPSA id h125sm3980771wmh.9.2021.09.21.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 12:26:08 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mathieu.poirier@linaro.org, bjorn.andersson@linaro.org,
        ohad@wizery.com,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v4 0/2] Amlogic Meson Always-On ARC remote-processor support
Date:   Tue, 21 Sep 2021 21:25:55 +0200
Message-Id: <20210921192557.1610709-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.33.0
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

Changes since v3 at [3]:
- fix "unsure" typo in Kconfig (thanks Mathieu)
- remove unnecessary #include <linux/ioport.h> as spotted by Mathieu
- add comment about the ARC core's memory starting address to
  meson_mx_ao_arc_rproc_da_to_va as recommended by Mathieu
- split long FIELD_PREP lines inside meson_mx_ao_arc_rproc_start() to
  first assign the value to a new temporary variable and then use that
  with writel() to make the code easier to read


[0] https://github.com/xdarklight/zephyr-rtos/commits/amlogic_ao_em4-20201229
[1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=407349
[2] https://patchwork.kernel.org/project/linux-amlogic/cover/20210102205904.2691120-1-martin.blumenstingl@googlemail.com/
[3] https://patchwork.kernel.org/project/linux-amlogic/cover/20210717234859.351911-1-martin.blumenstingl@googlemail.com/


Martin Blumenstingl (2):
  dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
  remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote
    procesor

 .../remoteproc/amlogic,meson-mx-ao-arc.yaml   |  87 ++++++
 drivers/remoteproc/Kconfig                    |  11 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/meson_mx_ao_arc.c          | 261 ++++++++++++++++++
 4 files changed, 360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
 create mode 100644 drivers/remoteproc/meson_mx_ao_arc.c

-- 
2.33.0

