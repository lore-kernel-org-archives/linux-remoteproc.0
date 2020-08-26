Return-Path: <SRS0=heY5=CE=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F42EC433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 26 Aug 2020 16:45:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0502320825
	for <linux-remoteproc@archiver.kernel.org>; Wed, 26 Aug 2020 16:45:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e4ZNNroa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgHZQpo (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 26 Aug 2020 12:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgHZQpc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 26 Aug 2020 12:45:32 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1232EC061756
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:32 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ls14so1119432pjb.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 26 Aug 2020 09:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=15mxbSikUleqN8D1YAzOW2MaGksrprUeUYpM9VqWUIg=;
        b=e4ZNNroaLq7afzbqudQmKu/XebEU12dV4cwOEZO5PGjjQksIMMrMzZU4zFt84smS4R
         kJVs4Ug8ZSSGHmLd6C07EpbBJQVs1vEmyg7qeE6G4SmKBKRNgy5Ao6ECqbMp0N8Rpcnx
         NQTIwmwlzQpbWA69PryOSYx4c7GIq5T1D9bQR2X2NYqTNbPCTtmW/GiNZJ/gzBalkyoN
         n1J1HXfljeORqhzj7W5PjQYY80g3nmyJJ/R+axemXsyt3qNIqev8sQTKc12P96eanaCG
         K+3h6MGVzeMIJFDNMLwA3SIUVYVq7lE93XaU2YiI9bpsbNVgvydex2htBIOQGIoCEUwa
         h8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=15mxbSikUleqN8D1YAzOW2MaGksrprUeUYpM9VqWUIg=;
        b=TINiF35w6w4Mtqfz2G+zVDUSQ2861kVgRrZHLV4bMOvQgLs95rTjTclYaEgMBYS3qF
         OPbERa7rcKWe16dwiF5+wE0oHmGRXBo+C9pTTQA1va+FInnLHjii/CC1eo0ND1crrhTB
         NiYuAcZXOpDzYIlqdUTF+Db4u/zptm8J3482GIse+uNGrb7xKQkF7ImmO4IXC6ES3ND9
         Kt8FYb718VRXkiMMdSpWkqvVvFQoltC6f846lkqSS1y21wlriLQ8QyL1mQbmXTkTq04k
         5j+QVYmdfr/BlqIN5zUIi9msEXgs13h5/5QMkAP+p3GPtFJPyqz82lknfNh/iUMltb0k
         cGBQ==
X-Gm-Message-State: AOAM530VHcfdu9m/P1J91ff6lmUeEHUcQgYVw0j0OVFcRBnlDcq77W3P
        CjUBIGrNskpu56sArIPFse9owg==
X-Google-Smtp-Source: ABdhPJwNzJHoyZuX62NxwhhcibMKbVEGHA8utGAYoW5T6sJQeXAri/BtpTXijArCoGFLdp+nNwZ8fQ==
X-Received: by 2002:a17:90a:4488:: with SMTP id t8mr7064939pjg.191.1598460331448;
        Wed, 26 Aug 2020 09:45:31 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id u3sm2548878pjn.29.2020.08.26.09.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 09:45:30 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] remoteproc: Add support for detaching from rproc 
Date:   Wed, 26 Aug 2020 10:45:16 -0600
Message-Id: <20200826164529.224476-1-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Following the work done here [1] this set provides support for the
remoteproc core to release resources associated with a remote processor
without having to switch it off. That way a platform driver can be removed
or the applcation processor power cycled while the remote processor is
still operating.

I have not tested the solution because of the work involved in getting
a new firmware image to support the feature.  I will do so once it is
determined that this is the right approach to follow.

Applies cleanly on rproc-next (62b8f9e99329)

Thanks,
Mathieu 

[1]. https://lkml.org/lkml/2020/7/14/1600

Mathieu Poirier (13):
  remoteproc: Re-check state in rproc_shutdown()
  remoteproc: Remove useless check in rproc_del()
  remoteproc: Add new RPROC_ATTACHED state
  remoteproc: Properly represent the attached state
  remoteproc: Add new detach() remoteproc operation
  remoteproc: Introduce function __rproc_detach()
  remoteproc: Introduce function rproc_detach()
  remoteproc: Rename function rproc_actuate()
  remoteproc: Add return value to function rproc_shutdown()
  remoteproc: Properly deal with a stop request when attached
  remoteproc: Properly deal with detach request
  remoteproc: Refactor rproc delete and cdev release path
  remoteproc: Properly deal with a kernel panic when attached

 drivers/remoteproc/remoteproc_cdev.c  |  18 ++-
 drivers/remoteproc/remoteproc_core.c  | 151 +++++++++++++++++++++-----
 drivers/remoteproc/remoteproc_sysfs.c |  17 ++-
 include/linux/remoteproc.h            |  14 ++-
 4 files changed, 157 insertions(+), 43 deletions(-)

-- 
2.25.1

