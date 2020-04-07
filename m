Return-Path: <SRS0=8QH8=5X=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE326C2BA1A
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Apr 2020 01:16:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A435D2076E
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Apr 2020 01:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DItxWHo1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgDGBQs (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 6 Apr 2020 21:16:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:48566 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726635AbgDGBQr (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 6 Apr 2020 21:16:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586222206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=5TH7w/JfrvK6PO93eOn/asqSkXlWjc9e7s1Mrzet5kE=;
        b=DItxWHo1onP01S5Mn6ZFOHKDEYzkrKZVfwBN+q9NU2DPRI3ZNa6ILEpOEQ0WiuC7LDSMLo
        0CT//Gyx1k/RphJYy1/+ofjMYJzcl7N2ahyY7i0Lvk+eEBQVaP10Ig8COeEghzT3q/J4A2
        3UVI7KSTJ3uP1I5SZ9sF2eQK+6TN4+w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-Y03AHXgOO_WmaAlpn-VpWw-1; Mon, 06 Apr 2020 21:16:45 -0400
X-MC-Unique: Y03AHXgOO_WmaAlpn-VpWw-1
Received: by mail-wr1-f70.google.com with SMTP id h95so856066wrh.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 06 Apr 2020 18:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5TH7w/JfrvK6PO93eOn/asqSkXlWjc9e7s1Mrzet5kE=;
        b=rbDeNX2yaJbglwDS4WRYmBQw3e1FA1bSsE0w4cZsXqmuEkFH+TUM6WLtB03hJrjxyv
         eFtS8Kejs9o6AThulX7gwNVGPQW7X7fvnvvhrCIeqGtrjBtOx/Ag7j8+Urg8c9E0aKji
         T7ithDvGNPWcUCNU6LP/JEoZn01i+BoBJMOlwV0j4HRI8MSQviFp2mYvqDhSH9cm3cTQ
         cs80BaweaOHbpg+bKzkvVT/ssk5blf2DNSbno7JoLitYDEOYtnR4Q/3QFJdOThZ5TEVl
         eMAriG24MLhiyBYvl5CEpEyWFjQW5g6k10zXh1HbIj1NJ0hn2tlsNqGAib8aqRZXhcBV
         pAew==
X-Gm-Message-State: AGi0PuaCRjMmbNF9zRCIhS+O2/2RPmzgMx9EOKwYHl/lYM7wG3QP0AJQ
        bbTX4n94xdBWx3ceNZM6R7L0INcL3lyGXXItLKlWM0hAqs96sDNebohOa15xS/wOCthg4cQhzcu
        oS711TCQUb0DfAHgyaDAZ6uoRGHzFmg==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr2102830wrq.345.1586222204017;
        Mon, 06 Apr 2020 18:16:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypIUKx/E68FBj3d4XOQ00hcyXYBl/67P8FPYE2YoFyXU7fFCF05zzALyhpIqvei+4TT7JQeC9g==
X-Received: by 2002:adf:f8c1:: with SMTP id f1mr2102818wrq.345.1586222203824;
        Mon, 06 Apr 2020 18:16:43 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id o67sm136301wmo.5.2020.04.06.18.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 18:16:43 -0700 (PDT)
Date:   Mon, 6 Apr 2020 21:16:42 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v8 07/19] remoteproc: pull in slab.h
Message-ID: <20200407011612.478226-8-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200407011642.bM_ukiSzv4LlgBVZKUlhL5jiwrebUUB6-c8qaUmXGgs@z>

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

