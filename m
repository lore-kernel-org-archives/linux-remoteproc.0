Return-Path: <SRS0=8QH8=5X=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FF1C2BA1B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Apr 2020 01:08:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A41B20719
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Apr 2020 01:08:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HTU0yNaM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgDGBHr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Apr 2020 21:07:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55779 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726552AbgDGBHq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Apr 2020 21:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586221665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5TH7w/JfrvK6PO93eOn/asqSkXlWjc9e7s1Mrzet5kE=;
        b=HTU0yNaMAGcK2lPvKssnI/NFrI342ixHfXQrfWXTpjpzzZeW1vtgklwxdlm6FneHSe/IUP
        tyyI1pF+0QfVhhz2jGA8Fz1CiuF99K8ASMoyf4bwY8QjekvY/N6oqPMFSe4T9O33xZvW6n
        LYYnUFJBV8HrPP3t860m5qKIWrapj3Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-aVkn_MMIOi-S9yV9xkOFEQ-1; Mon, 06 Apr 2020 21:07:44 -0400
X-MC-Unique: aVkn_MMIOi-S9yV9xkOFEQ-1
Received: by mail-wr1-f71.google.com with SMTP id g6so853128wru.8
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2020 18:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5TH7w/JfrvK6PO93eOn/asqSkXlWjc9e7s1Mrzet5kE=;
        b=Z7kr8dn4NKYskwpLCE/maeFcOP7tnQ1mRjoP/TH2GdLB2o+hJZOSO2MaYdXmPcSF+F
         5J0cvt0qDZ02RkDTtbbxjv44QqBaKdY8uIalGoT7Oz8j5VQZrs8GRP/MLwXcOBlDviQ3
         OkjAfl0YUoExlizeUFBqZzZvPmQNuEiS2e1W/h4xssMpqv1CPMWvx5X7rHVPqRXI8W7V
         MgKGYscuqYr2PLcQTzKYxyeiHW6TeiGodiXKn1GbJxTAjlb+I77l1TCoTjvaJU0kGtDj
         abe3ef5CU7s8x3OJRA1TEu1/HMPIya1l8hya2GRpBjumaF5c3FhLRLJi2xDCQ6lOLVmp
         CUqQ==
X-Gm-Message-State: AGi0PuY5NjVLWNcGItetLMZjTJAAkR6WhpoakLx6cUGF+7f6NgqGmoZd
        llwtoZSrrZ9WPuKCCn83bMm9bhqxMIEoL4PQl7I7bm+5NxsT+ms3iAxmObXrWLtpNbTPMdQEEae
        Es7vekIDCnfBBut3c1Wvd/EGcxfXnCA==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr1992023wmj.17.1586221662967;
        Mon, 06 Apr 2020 18:07:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypKi5SDLXVoxB05X0Fa1g9oKsnmtj3oVbQGLHfVW+Qb94Vy8QZNx7bP9RNsJ+Ug6e0rfRynbiA==
X-Received: by 2002:a7b:cb45:: with SMTP id v5mr1992013wmj.17.1586221662773;
        Mon, 06 Apr 2020 18:07:42 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id o16sm28751497wrw.75.2020.04.06.18.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 18:07:42 -0700 (PDT)
Date:   Mon, 6 Apr 2020 21:07:40 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v7 07/19] remoteproc: pull in slab.h
Message-ID: <20200407010700.446571-8-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200407010740.av-q1yNFb2OkNo9sYhP3e6Q4u7ZK_VTpa_OqYqlYrVo@z>

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/remoteproc/remoteproc_sysfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
index 7f8536b73295..52b871327b55 100644
--- a/drivers/remoteproc/remoteproc_sysfs.c
+++ b/drivers/remoteproc/remoteproc_sysfs.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/remoteproc.h>
+#include <linux/slab.h>
 
 #include "remoteproc_internal.h"
 
-- 
MST

