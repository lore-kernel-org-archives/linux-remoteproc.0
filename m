Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B547C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:31:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4AD46115A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Nov 2021 08:31:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244077AbhKIIdv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Nov 2021 03:33:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244071AbhKIIds (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Nov 2021 03:33:48 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54506C061764;
        Tue,  9 Nov 2021 00:31:02 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d5so31564415wrc.1;
        Tue, 09 Nov 2021 00:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=unuXmXs/dvGgqVqGq+uRDlZebRR93xnb/ylYDWpJ5xg=;
        b=P1smeGAzzLUluvWADi3R9qZ0ZYcDwRTTDgzSFUvEJj+wKkXLLDjyb8iAOzcLu9bXKU
         PbKYz1Df1nUBlJtrx3o6TBSWB4wzW3+PD6bZLVRRG5sAXkIIXXmBVndw/U8BpEvhqqOO
         n7QxxrD4XWkOP46fVNDnakxs/IW8YQc6f+gVtAH9chmgi1L8ARNSz01s9pF3imzp5fo/
         0ptuZ4bc4cIWYYFlAZJC4xsV4xYL9dHCFoSXoTfqzt7MLYr66sZQBTqRAnDPHaxSXNGW
         m65K1wqHzSHV3c3PkCXkiRN7P+ObHEDj6hQ146hl9w9xpO/kuj2Kvzp8NCuA8UMIRXwZ
         jisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=unuXmXs/dvGgqVqGq+uRDlZebRR93xnb/ylYDWpJ5xg=;
        b=Y8zpcXG4HJbKTVe44fn84OnnRcRX8dKelRwjsmFs/LuFRMIExmKC7XH/0zKcIAI4Qz
         Lo3mpkXST//SprP4WaMSZnshz01HJ6qY22vDvolbL2Uweau1glxdsDViVAJQvdXfqMs7
         bcdk1xU2WDqN6ibrAuBiYk7dev0S/2E8be6dqcB34ukCQqVVYRIYScU/FT6jPURV5k+n
         mtDClNRq6yZUoIdV/a7EcWoTj7ickbA+g4EAxaQAKOGu+lIiVYBXN9gXd2uH0grFLD90
         DLUsIwlQeZK6SzPnD27DBVttepN9h+tjK+jt4xfeaxhsoKBCAwaNlmDrNQofdxo/B0i4
         9MqQ==
X-Gm-Message-State: AOAM533ggja/f5cpq5ltgsLHo06FRHzAoX2P1hoB8Pke565+F3DV6lPE
        UBBPXR9kMUaiV5IZ8WWqrPQWsr0vKiA=
X-Google-Smtp-Source: ABdhPJx28T6WgUKO8jYf/Kat6J64nSuGuYoxtKadTtBdt0Nzv6aiBc5KG+k7HjqX2BXIzhYcsnyIdQ==
X-Received: by 2002:a05:6000:2a3:: with SMTP id l3mr7131173wry.415.1636446660558;
        Tue, 09 Nov 2021 00:31:00 -0800 (PST)
Received: from localhost.localdomain.at (62-178-82-229.cable.dynamic.surfer.at. [62.178.82.229])
        by smtp.gmail.com with ESMTPSA id v185sm1821600wme.35.2021.11.09.00.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 00:30:59 -0800 (PST)
From:   Christian Gmeiner <christian.gmeiner@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Christian Gmeiner <christian.gmeiner@gmail.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 0/1] rpmsg: syslog driver
Date:   Tue,  9 Nov 2021 09:30:43 +0100
Message-Id: <20211109083051.17831-1-christian.gmeiner@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

I am sending this patch as RFC I am am aware that this is
not ready for inclusion. I am however want to get some
feedback on this choosen approach. In the end I want to be
able to get log messages from the remote firmware into syslog.

Christian Gmeiner (1):
  rpmsg: add syslog driver

 drivers/rpmsg/Kconfig  | 8 ++++++++
 drivers/rpmsg/Makefile | 1 +
 2 files changed, 9 insertions(+)

-- 
2.33.1

