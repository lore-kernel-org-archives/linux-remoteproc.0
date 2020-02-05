Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from wsip-184-185-158-229.sd.sd.cox.net ([184.185.158.229]:27416
        "EHLO s0-postfix.allcaps.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727771AbgBEK3S (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 5 Feb 2020 05:29:18 -0500
Received: from MacBook-Pro.local (ip68-7-58-241.sd.sd.cox.net [68.7.58.241])
        by s0-postfix.allcaps.org (Postfix) with ESMTPSA id 586D51C64046
        for <linux-remoteproc@vger.kernel.org>; Wed,  5 Feb 2020 01:13:44 -0800 (PST)
From: "Andrew P. Lentvorski" <bsder@allcaps.org>
Subject: How to get src and dst for pru_rpmsg_send?
Message-ID: <f22d9305-326f-f584-4480-9509c5f903fb@allcaps.org>
Date: Wed, 5 Feb 2020 02:24:07 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

I seem to be missing something obvious: Where do I get the values for
src and dst in the pru_rpmsg_send() function?

The TI examples do a pru_rpmsg_receive() first and then echo back to the
same src and dst.  That seems ... odd.  What's the point of having a
variable src and dst if they are effectively hardwired to a single
communication channel?

Thanks.
