Return-Path: <SRS0=mwZV=5W=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0AFC2BA1A
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Apr 2020 22:26:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1ED2D20753
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Apr 2020 22:26:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRQQfrRa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgDFW06 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Apr 2020 18:26:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31099 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726586AbgDFW05 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Apr 2020 18:26:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586212016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sGNQNkbNwJWickjlRxXK9zH9MXSx5qKtnPAyeHR3Xys=;
        b=hRQQfrRag/lnGyEXobu3tPqJAX+ytKUk3RTS+F5HaM+hEadGxAlKq0W0xP8bVbKYhuVnrU
        Cojuof7Wd6qTDuBdqTMS1sH/HyfBzdhd9iLTCUl2CXM85VKTdacvUMane6iiCotoeWEHR9
        VVFJzv4GG24fVt70OYMFrK79I6S2TAM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-YNfywxYFP_GN7BckdYEnyg-1; Mon, 06 Apr 2020 18:26:54 -0400
X-MC-Unique: YNfywxYFP_GN7BckdYEnyg-1
Received: by mail-wr1-f70.google.com with SMTP id d4so648779wrq.10
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2020 15:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sGNQNkbNwJWickjlRxXK9zH9MXSx5qKtnPAyeHR3Xys=;
        b=P/7GCwrROpYgM/RR9Ka6bbVeBuU4QF2ZgNGehyzV4DDEaTE2Jg9MLx45gjf++JXMIH
         bDoONOa7Ze2X1GC5RECuYP+xCnC122Hy6PChZIETrJ0DkmerEc0jTiKL4oAoud5haTJK
         ZFl2JFEJfJ9hVBrEgTlMb8t0dU7u5LJwl3+qY7rI4jHYA5PXSJc1T1CjX/7O750+rfm5
         0WqSStn03vT4GVnj+0tCmlK1kCS8kELAEPY02QOj07YoGcHhii5j0gph/tpchNz1Wo0l
         Pql7J67X/YaZt0zkB8ZrZNxQ0I/O6HbB+gPfP6bsHE7MJQh2WQCGEEW1gFIEbsHD5YCr
         v1/w==
X-Gm-Message-State: AGi0PuZl6Y0muRztI7PvCo8YJFItueepluWzdZBFo1CsrVzvjyB2k3Gy
        WydPaUObJ2LSg4pUTjO5uTPW5ZKTpabW3iw1EQ2f1ugWRJ6xJIgJZQ9/qEMvvlGSLxb+e/XZk9o
        GiVBY0MCviBvvN9TSw4lY/rCQfbVrJw==
X-Received: by 2002:a5d:688e:: with SMTP id h14mr1589672wru.372.1586212012783;
        Mon, 06 Apr 2020 15:26:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypKugF2uUocJlMIxJYAVtDr6RsGartXONR6Ws52dqmZjr+1kpYMbnATkUFh4PIrqGiUfbeyzvA==
X-Received: by 2002:a5d:688e:: with SMTP id h14mr1589659wru.372.1586212012581;
        Mon, 06 Apr 2020 15:26:52 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id b15sm27488656wru.70.2020.04.06.15.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 15:26:52 -0700 (PDT)
Date:   Mon, 6 Apr 2020 18:26:50 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v6 11/12] remoteproc: switch to virtio_legacy_init/size
Message-ID: <20200406222507.281867-12-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200406222650.O-9xhtJJOuftjUkxar8Q2pudz9YJEWRy-o5Kzmr3UKk@z>

These are used for legacy ring format, switch to APIs that make this
explicit.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

maintainers, pls ack merging this through virtio tree due to dependency
on previous patches in the patchset.

 drivers/remoteproc/remoteproc_core.c   | 2 +-
 drivers/remoteproc/remoteproc_virtio.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

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
 
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 8c07cb2ca8ba..35b02468197a 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -95,7 +95,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	len = rvring->len;
 
 	/* zero vring */
-	size = vring_size(len, rvring->align);
+	size = vring_legacy_size(len, rvring->align);
 	memset(addr, 0, size);
 
 	dev_dbg(dev, "vring%d: va %pK qsz %d notifyid %d\n",
-- 
MST

