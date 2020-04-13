Return-Path: <SRS0=OzSZ=55=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AA6C2BA2B
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 19:34:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB36920731
	for <linux-remoteproc@archiver.kernel.org>; Mon, 13 Apr 2020 19:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rQMPxkwS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387891AbgDMTeJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 13 Apr 2020 15:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387876AbgDMTeF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 13 Apr 2020 15:34:05 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19876C0A3BE2
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 12:34:04 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id g2so3768986plo.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 13 Apr 2020 12:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uy1IdPuBXp7VgVD7eTNB6uNJOU6qTuzmXsvstPKTvdc=;
        b=rQMPxkwS4+7Mq/Yq3K5p+s0kbh0EQ4YHqy9tnYxTmuVtLvpLCfnb4FDrqOoM7P5+iY
         +l2lfpazPOkQEqQ12MqfPlEfI8L3r2U7vV2YYb6dsJ5YxnGapRwqcGxEjY20jkL3yg48
         u6NuAzGo71MDSwc8XK8OMt1pp+k1mnO0jpP3ZNRyfND2xCU+QTbgo4qC3Uc02iLEkPxE
         8Kdhfoi3fJ1oib/m9cHWPeGF8L6NE9k1r+wT+JX5dENy/keMTELSDH8CfAQMPwRIlXLN
         H4EA47L32xUuo4h+PR6UUMQud0agY+gRSAEZr5TYUjLT8BO5lBRMndK9KjWbofw5/F3r
         ONWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uy1IdPuBXp7VgVD7eTNB6uNJOU6qTuzmXsvstPKTvdc=;
        b=ebvPSb6eoHALzrOPxW3RFPOCbJ5BeuRvcPb/jiwoBnZ32bkyUoLMYiVIvaJBxHC0VT
         6cCY79pXqN835V7tnKjyudeZ7U0WTknA9TIdD2TluiD2r7r631OHaE+gkohEwaNlmH8a
         zdeEXvczKMNxjYQ0/sbbelh+JwtLXezdqYjq/58i/hwsvndNRAQZltcr9/yEsW1/Igl8
         CkGg5mnqoq+0Q+B21wrUTiQNpJBvmo51OEHLNgVUiHAyxjjf5bruN6OT0hvvp+2jiO8b
         xB2SWj6iK8mkNEb63BQcZ7ADzaxDeDdKhYz9X/vUSVXfVCkbxaXX2de9hDjcr4cBwAQg
         IksA==
X-Gm-Message-State: AGi0PuacjhviwruklhR48srX+y0r/jdE0DF5DeXbAeLzWAtmbQV2A3Sr
        fTDL00jpUiZs+u2QvkNSuEjSlg==
X-Google-Smtp-Source: APiQypJDiXvrVscdRWIFzgkmw0vE0eAonIfSGOofEC/ATUFi6ujjyiKxZmJrLM+w6EdsaWDcuEC7PQ==
X-Received: by 2002:a17:90a:dc01:: with SMTP id i1mr6256901pjv.154.1586806443522;
        Mon, 13 Apr 2020 12:34:03 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id ml24sm7032330pjb.48.2020.04.13.12.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 12:34:02 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     s-anna@ti.com, elder@linaro.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] remoteproc: Refactor function rproc_alloc() 
Date:   Mon, 13 Apr 2020 13:33:57 -0600
Message-Id: <20200413193401.27234-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200413193357.9A3ahaWZH9YIe2iFhQA6DQEjgTGNwi56RoGHvVu1JG8@z>

Hi Bjorn,

Function rproc_alloc() had to be reworked as part of my work on MCU
synchronisation[1].  Concurrent to that Suman [2] and Alex [3] also did
some work on the same function.  

In order to provide a clean foundation for everyone to work from and avoid
unpleasant merge conflicts this set gathers the work that both Alex and I
did.  That way Suman and I can move forward with our respective patchsets
without too much headache.   

Applies cleanly on v5.7-rc1.

Thanks,
Mathieu

[1]. https://patchwork.kernel.org/project/linux-remoteproc/list/?series=261069
[2]. https://patchwork.kernel.org/patch/11456385/
[3]. https://patchwork.kernel.org/patch/11473241/ 

Alex Elder (1):
  remoteproc: Fix a bug in rproc_alloc()

Mathieu Poirier (3):
  remoteproc: Split firmware name allocation from rproc_alloc()
  remoteproc: Split rproc_ops allocation from rproc_alloc()
  remoteproc: Get rid of tedious error path

 drivers/remoteproc/remoteproc_core.c | 101 +++++++++++++++------------
 1 file changed, 58 insertions(+), 43 deletions(-)

-- 
2.20.1

