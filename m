Return-Path: <SRS0=mwZV=5W=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327DAC2BA80
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Apr 2020 21:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0C5AD206B8
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Apr 2020 21:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekE3m8Zu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgDFVCV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Apr 2020 17:02:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:53305 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726628AbgDFVCV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Apr 2020 17:02:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586206940;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g21Qo7QtPcOJEghRPDvMQfA4S9QNIdU3sAG/Fw2UsOU=;
        b=ekE3m8ZuDHiek0ku2b1wxaR/Z/+aFhprJDF/1Jkro3yE3POgzSemylOtjr/CIzpESMmquN
        WXl+PG+KT413udDiz/9qbNNegsbMNIw7k/A2P+3fWhV+tQJMFnD4JyOGiHKFq8buuUCc82
        k5TTua8+1faGLc604sAAC31u1XTCgms=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-pZGSTPoNNiCWLj9lefoTsw-1; Mon, 06 Apr 2020 17:02:18 -0400
X-MC-Unique: pZGSTPoNNiCWLj9lefoTsw-1
Received: by mail-wr1-f71.google.com with SMTP id h14so525254wrr.12
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2020 14:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g21Qo7QtPcOJEghRPDvMQfA4S9QNIdU3sAG/Fw2UsOU=;
        b=Rf+8oCio9X+B+MSb1ytCSBQ3NNJ5MMHa+uRaIJj26U+J6to4QJvmBjjjNEpc+mhjAu
         Tkf1JWfRc+pNKdjoiSKsS636fRkNe0fqkB6KADh3GHyordrhiwXUYTayhyNqL/0D9f5R
         enCV1UsIXi+fxuKTNy0UtFihy5pq8UunRyj7jHuk8cVTsR9FK50ssEmp2n25fiVdrITJ
         yI5Hzh5sewUtAW0d4sCMFyllgqQIpmUOdnxHUkI2fD6iXrXnGtvB7kk+LSEgdU7aJZdI
         lF68++VeVsdl6rPq1fP4+gB0IyvAbSc++un2YIXiV55NbbFi764Cz7fZC3DZB6jnPKaI
         IlwA==
X-Gm-Message-State: AGi0PuYFRA6Cl8YrYj7366L7X/dOgGxRO+ORIVQlhag7XNEggZ8/TtEV
        QEEDUXdP2FaWFwGwiPxG21SMFNfSFX/lEp0FzbBZlrZ0c7mq0y8fNQrVq80UhouVi2n93Eqr1Zm
        Icuu/MT28pqlGd9SSBARzLcpIY1VikA==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr1333580wmb.92.1586206936901;
        Mon, 06 Apr 2020 14:02:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypI5XZ+o0zl+Xjii6R2ZxpTo8wJSgUW9OoxrS+ssp1PhHsSDSD9x+AsUIKw9dscJ9d5JnCrL9A==
X-Received: by 2002:a1c:6503:: with SMTP id z3mr1333570wmb.92.1586206936739;
        Mon, 06 Apr 2020 14:02:16 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id u22sm905456wmu.43.2020.04.06.14.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 14:02:16 -0700 (PDT)
Date:   Mon, 6 Apr 2020 17:02:14 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v4 11/12] remoteproc: switch to virtio_legacy_init/size
Message-ID: <20200406210108.148131-12-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200406210214.du-zAakOJMOBBPzQ1f_O-EIeOFYo8pAazNk1yQkHalw@z>

These are used for legacy ring format, switch to APIs that make this
explicit.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 097f33e4f1f3..c350a01e6c4e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -322,7 +322,7 @@ int rproc_alloc_vring(struct rproc_vdev *rvdev, int i)
 	struct rproc_mem_entry *mem;
 
 	/* actual size of vring (in bytes) */
-	size = PAGE_ALIGN(vring_size(rvring->len, rvring->align));
+	size = PAGE_ALIGN(vring_legacy_size(rvring->len, rvring->align));
 
 	rsc = (void *)rproc->table_ptr + rvdev->rsc_offset;
 
-- 
MST

