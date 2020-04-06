Return-Path: <SRS0=mwZV=5W=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3C0C2BA2B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Apr 2020 21:34:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD48A20787
	for <linux-remoteproc@archiver.kernel.org>; Mon,  6 Apr 2020 21:34:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LozRsEuS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgDFVex (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Apr 2020 17:34:53 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35604 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726634AbgDFVex (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Apr 2020 17:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586208892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=g21Qo7QtPcOJEghRPDvMQfA4S9QNIdU3sAG/Fw2UsOU=;
        b=LozRsEuSwMwDN/cAWmI+3A9Grhvo2u2KzBQXDPAgPo0Bk4a5zSqgXj4sn6qDU1veZm2e6o
        GBnxr/YH6LT4q+i6/QWsmnZ3pPgLGej+h0z7Yvt5tmTePG6rbrJoAEm1VuhTjyvdUHZDN/
        jEOS71fXt1k6ymyILUCNgXm5+wGvV9E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-TJTIxqaONWGN-DtFzVli8A-1; Mon, 06 Apr 2020 17:34:51 -0400
X-MC-Unique: TJTIxqaONWGN-DtFzVli8A-1
Received: by mail-wr1-f70.google.com with SMTP id o10so577443wrj.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2020 14:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g21Qo7QtPcOJEghRPDvMQfA4S9QNIdU3sAG/Fw2UsOU=;
        b=iaX0o53uFCg/8kesPBA6WuIUM7I4WAw7IjK50aoMGN4n/E9CLu7Q/H5VCj3X9CMUb8
         2Fw6W+dD3p9ftABSob80AyrdxNxcjsamSEQl6CKpO0p0aLvwGifbxzEesX0cLL9gT1Z+
         3ALchKly/lWo7dC3riVCn4nNkZf29MT9roSOEs+SkQ0MBVfgzB4/a8tTdEZsEVwzQ3RJ
         FeiLPQCSxw38kw1sywNGjIslxMQaJkwiSA00LhsGmLt/juiORt1fGff5sOAYeEnK1rNl
         3oBfpG5IlEuY7McEKmeicP5MZJ1rr72b4EsUMbcScw2Ai7vNKcqIcEoHXOgN57WTl5NY
         roPQ==
X-Gm-Message-State: AGi0PuaMwN9jPNIher6PgbENx3w0qCav3lj3uDcoRD6gMB1XhTdwOu/V
        g1iGBsWwM4r23eQburpnk96161L6bnElD4hAtqwYShYjFPF9bbaZ0M2+O7K1gz8unvWvoEzHfU+
        58FSKzzuAzHeLZOY3SJHWt+F+uJz5ew==
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr1437681wmj.102.1586208890217;
        Mon, 06 Apr 2020 14:34:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypKAZJhwUAhdJ4atiej6VK/mv8hk/1Y5ETF7CybO37bXvAJPTN+IEMIUppA3nQ+/F7Q27F9Y9g==
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr1437667wmj.102.1586208890008;
        Mon, 06 Apr 2020 14:34:50 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id t16sm29149843wra.17.2020.04.06.14.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 14:34:49 -0700 (PDT)
Date:   Mon, 6 Apr 2020 17:34:48 -0400
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
Message-ID: <20200406213448.vG-QWEmQpEkDpZkf7PJmE9criSifTJfT3qOMknwzlnI@z>

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

