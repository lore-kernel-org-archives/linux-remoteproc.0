Return-Path: <SRS0=9kKd=5T=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C901C2BA12
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Apr 2020 17:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2A64F2080C
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Apr 2020 17:50:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hnyAoV/8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727882AbgDCRuN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Apr 2020 13:50:13 -0400
Received: from mail-qv1-f67.google.com ([209.85.219.67]:37001 "EHLO
        mail-qv1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403981AbgDCRuM (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Apr 2020 13:50:12 -0400
Received: by mail-qv1-f67.google.com with SMTP id n1so4035387qvz.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Apr 2020 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RqKi5kQS7abbcK/m1MeYgXWyu5S1dWWUHnw0at9jU4=;
        b=hnyAoV/88z+dlStydxHrx8vJJda32g/f6iLhSfqsoXgbvHFR0fKod2GO+mjA7AMilm
         K8sayx6yZNn4mNTqNmSHR6Z4zshubd5vm+PpE9d/xCiHeAfvwbc2fWlWkKpxe/3Qna/w
         o95oqnQsktIYx+OQHocxLgJwacDbZI75GdSX8UzoQznNWqoS7/+i3TbeF3BqpecqkDg3
         xtCX75JbLMROPmKKjR8HzUg1PbHYFI7fRb505sSqP05/wdQFrGvwapN82De8OjTed/+Z
         D10mknQQn1jwnOlj7ZGc49ajapHlBqsVMl8vy803lptaH1CA58uvrEqpgY4gP9sWZecb
         gpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6RqKi5kQS7abbcK/m1MeYgXWyu5S1dWWUHnw0at9jU4=;
        b=VI7nbv1tlxuIGpuBfKXuOgcJYz4fSsFz22Fbd4+7Y6D/phTcfPhK+sEejEw/W5ylor
         pN7/OkDSfggd2PeKrQmt072j5qil2VUgdc3hUJN9S0MB4lA+G2JYLWFHC4Ga/ezH945A
         V2upaYBbiUy29IvPEJGtoR72172oL0Q1MBy2K0FhDNzhlAzg8CSGgRlonAxfuEckJpci
         HtF/tHkaiPAd93p1YrK82ECkF1nbDasHByE1L5osDA4BPmOOHkIpTLUEs94Q4nRjVyRT
         K/ydEZT03a9lTpYCSSTcLZtzoqBQq+ZP6+VcyZi4gzMJJeOtedE0c4H9JBlKiPXqVy4P
         5qlw==
X-Gm-Message-State: AGi0PuawSC0N6oe4FBk5cImhp8g3AJUsBggJ5yWh8UlWlo9NEqSdtzgX
        4qERODL7Un7Cbe0T27wjGMBq1g==
X-Google-Smtp-Source: APiQypKqlXQdNVDSxOjJ1Ms50Az8IIgj5YUggK9m6THUtnyNdT511yDYfxOcjAcIrniOVwzOCbpasA==
X-Received: by 2002:a05:6214:b0a:: with SMTP id u10mr9744314qvj.45.1585936211473;
        Fri, 03 Apr 2020 10:50:11 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 77sm6821225qkh.26.2020.04.03.10.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 10:50:10 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] remoteproc: bug fixes
Date:   Fri,  3 Apr 2020 12:50:02 -0500
Message-Id: <20200403175005.17130-1-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200403175002.JxL7f9SHtb_cDBYUutrnx4HH2riJAhvfzrfh7hs9Cwk@z>

This series fixes some bugs in remoteproc error paths.  The last
patch is derived from something I posted before, but has been
updated to based on Linus' current master branch.

					-Alex

Alex Elder (3):
  remoteproc: fix a bug in rproc_alloc()
  remoteproc: qcom_q6v5_mss: fix a bug in q6v5_probe()
  remoteproc: qcom_q6v5_mss: fix q6v5_probe() error paths

 drivers/remoteproc/qcom_q6v5_mss.c   | 33 +++++++++++++++++-----------
 drivers/remoteproc/remoteproc_core.c |  4 ++--
 2 files changed, 22 insertions(+), 15 deletions(-)

-- 
2.20.1

