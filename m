Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44B3C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 12:58:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F8C261288
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 12:58:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244979AbhIQM72 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Sep 2021 08:59:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244992AbhIQM7Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Sep 2021 08:59:24 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1357DC0613DE
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Sep 2021 05:58:02 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso6811258wmd.5
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Sep 2021 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plrOrvIZM2TLyxiMQcIWBN+4lREuMv3pRG/Sh7a1xC8=;
        b=A1XyPdxcOquLxN0aX50A1ZFpsIYqi3fOAj7lTpkAapmpB6s0I7t5BtLQBntoT5o/gC
         LTk3U5iGqZXV00d7UWu1zJeHwNQUIaZQXm49I9GxJIR/4y18GU6Nvyoikkh2w2l4zgcp
         B3UYoAnqDqm9GVkUY9hqfwcQPouBjXs+iZX47NO/QJ/t4wb1kggMVtkvmAtzd4qzJFRW
         7nWbDttoNJXmYKodYdihre5foSUAr0yPacNcyWtLspR5zCXh9y8npouXY1dRxKM6UQcn
         WZ3a9DrYMmZAVwaW7QgPnDaW9jP4k2Ex3PG5EKtnNHZgrO8bzEd2qcrTOZ99BSIM62Lu
         8eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plrOrvIZM2TLyxiMQcIWBN+4lREuMv3pRG/Sh7a1xC8=;
        b=htGh3/XbzuE4XpzVFu3ewN2Y5gSGFf3iyWuGRml82HLjicm9qEZboA5uB0vR9OXrUw
         TmYB+TvyW5/pphmcrKTFQiKWhLkHDqUXPiIEavTMKmqN5f0NrN8N4JHKGxk55uPVxcN4
         cHnyNN9dgPJoMY8zXpXA4DuXeNxCseckTQ4fI7JvUAmGD3fWb7854NiG9YkMW8/KzQ0E
         sgGpkP2HAGlOFeZludyqQf+4lBRp6OOBcr73f8NXLgNa1GZSm5Ta2MwLs04WpMqGQT6g
         PbxadysdY1x8qKgfPv6E7cOHoVocD0lnDpjLmHd4xLjM4u/Wc04/EVRs1SY4wMqzGV7E
         Z2Kw==
X-Gm-Message-State: AOAM533fIOMKWn4rwq+eQPfFFuirlJCCcTR/sTgXBjCtsMxCxd88aD98
        iu50pRDuGhxmV4bN1Ow3XeH6pQ==
X-Google-Smtp-Source: ABdhPJxTbG15Mr23ALcQTVgBRPbbO7jTynJgRBVrKM9JKm3YI/iNB4vjrE9aSV9fhOwwMUSmYbl5Hw==
X-Received: by 2002:a7b:c086:: with SMTP id r6mr10257667wmh.46.1631883480653;
        Fri, 17 Sep 2021 05:58:00 -0700 (PDT)
Received: from localhost.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:58:00 -0700 (PDT)
From:   Alexandre Bailon <abailon@baylibre.com>
To:     airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
        matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        sumit.semwal@linaro.org
Cc:     christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, khilman@baylibre.com,
        gpain@baylibre.com, Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 4/4] ARM64: mt8183-pumpkin: Add the APU DRM device
Date:   Fri, 17 Sep 2021 14:59:45 +0200
Message-Id: <20210917125945.620097-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210917125945.620097-1-abailon@baylibre.com>
References: <20210917125945.620097-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This add the APU DRM device to pumkpin.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 7fbed2b7bc6f8..c540dbfe30151 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -98,6 +98,12 @@ ntc {
 		pulldown-ohm = <0>;
 		io-channels = <&auxadc 0>;
 	};
+
+	apu_drm@0 {
+		compatible = "mediatek,apu-drm";
+		remoteproc = <&apu0>, <&apu1>;
+		iova = <0 0x60000000 0 0x10000000>;
+	};
 };
 
 &auxadc {
-- 
2.31.1

