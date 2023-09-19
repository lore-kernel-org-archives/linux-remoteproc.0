Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEB8CD3439
	for <linux-remoteproc@archiver.kernel.org>; Tue, 19 Sep 2023 05:03:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbjISFDS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 19 Sep 2023 01:03:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbjISFDR (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 19 Sep 2023 01:03:17 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76413FF
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Sep 2023 22:03:11 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-68fac346f6aso4751553b3a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Sep 2023 22:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695099791; x=1695704591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=laTm7dnxWOCcW2RIknshlwm/kbQUB6RtmbdVs9LREqk=;
        b=bh838skYf6q2+kziJFwbN6I9NdK2rrEx14g0w0D7LeYAig8uyCed0K90mzyrD3fn8Q
         QTUd9N1BoXa5xiuUjcXGWb2VvuolhEftKzoZ0pdM+c0ZGukEZ44C4DunILe37EsH7slz
         YMLrCQPJfpmA92Ce9fWMeIrdMDwmk7SERw9fA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695099791; x=1695704591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laTm7dnxWOCcW2RIknshlwm/kbQUB6RtmbdVs9LREqk=;
        b=ohHT+l07zjBJZo4iT+XajhXBTGEC9MYgJELzIyJkXsn0XKdYkTSZ349YRJZ03BTpgI
         FmbgQ1iWM+vkUXNZCtxkNP3doWkoBQO6GTlTOPkgmhzSanGGo7Q1lnFmaEZItzC1B3cP
         8Kk1p60FQ8XiXUMT8nJ3a0p24Mn0A/Vmp77mI+tmKAi8mWBjlVubt8K7owg/DTXcwxHY
         CoBPRMbV8RT+gAXwtFIGGP9BjPqDy4RRYSxVgYYl/AJkUQPE+4cXay5rY0AlBr0mhPUV
         XP4OtGzv19Cx6C7UfZQGiUKZuNhiakr5oh71rzVR1499nvZBHYJAUhUNMWajeq3qHbfj
         U9sA==
X-Gm-Message-State: AOJu0Yw0Bod2NlYUGcZhY13vpz6y4jiN+0brauftKIJ1OSuxr4lSSzXx
        RgpDGW/RP3D5Z+IzOuSrqe6Vow==
X-Google-Smtp-Source: AGHT+IGycmQsNFwgoBQwKURop8RFXZn7kdUvjCHaXVun+krQq3OvwV8JGEXJPbCRePSXThTCs6siig==
X-Received: by 2002:a05:6a20:5611:b0:14e:b4d5:782e with SMTP id ir17-20020a056a20561100b0014eb4d5782emr11869037pzc.29.1695099790851;
        Mon, 18 Sep 2023 22:03:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id z13-20020aa785cd000000b00686edf28c22sm313169pfn.87.2023.09.18.22.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 22:03:10 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laura Nao <laura.nao@collabora.com>
Subject: [PATCH] remoteproc: mediatek: Detect single/multi core SCP with rpmsg-name property
Date:   Tue, 19 Sep 2023 13:03:04 +0800
Message-ID: <20230919050305.3817347-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

In the just landed multi-core SCP work, detection of single/multi core
SCP is done by checking the immediate child node of the SCP complex
device node. In the original work this was done by matching the child
node's name. However the name wasn't previously standardized. This
resulted in breakage on MT8183 and MT8192 Chromebooks while the driver
side changes were picked up and the device tree changes were not picked
up.

Instead, match against the "mediatek,rpmsg-name" property, which is
required to be present in the rpmsg sub-node. This makes the
aforementioned devices running old device trees working again.

Reported-by: Laura Nao <laura.nao@collabora.com>
Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
The patch is based on next-20230918 with a whole bunch of local patches
stacked on top. None of my local patches are related to remoteproc, so
it should be fine.

I tested on both MT8183 Juniper and MT8192 Hayato and on both systems
the SCP successfully probed again.

 drivers/remoteproc/mtk_scp.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ea227b566c54..ca15d9f382a1 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1149,13 +1149,23 @@ static int scp_is_single_core(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct device_node *child;
+	bool has_rpmsg;
 
 	child = of_get_next_available_child(np, NULL);
 	if (!child)
 		return dev_err_probe(dev, -ENODEV, "No child node\n");
 
+	/*
+	 * On single core SCP systems, the immediate child of the SCP device
+	 * is the rpmsg node; on multi core systems, there's an intermediate
+	 * level node, one describing each core. Instead of matching on the
+	 * node name, which was recently changed in the DT binding in a
+	 * backward incompatible way, match against the "mediatek,rpmsg-name"
+	 * property, which is required in all rpmsg sub-nodes.
+	 */
+	has_rpmsg = of_property_present(child, "mediatek,rpmsg-name");
 	of_node_put(child);
-	return of_node_name_eq(child, "cros-ec-rpmsg");
+	return has_rpmsg;
 }
 
 static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
-- 
2.42.0.459.ge4e396fd5e-goog

