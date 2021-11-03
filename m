Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD80AC433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Nov 2021 17:16:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C08536109F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  3 Nov 2021 17:16:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhKCRTf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 3 Nov 2021 13:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbhKCRTf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 3 Nov 2021 13:19:35 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F059C061203
        for <linux-remoteproc@vger.kernel.org>; Wed,  3 Nov 2021 10:16:58 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id n8so2954657plf.4
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Nov 2021 10:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bV161Tgs4wSnzMybCdsPXiLVkj0ud2/om2LUNqGC1RA=;
        b=ZRMroyRI+rPDWvePSSpTvBhiJsCJEQmo2gt/kDiy/MlSfUtg7NNa0p2QaZUikvBA0n
         zyFTTC2Qc1Z5Tzzn0Nluc1PqpAmhJf7FSULF8I+1qo+QgLQ8pAWGoxdz5CHT1yipbSan
         rH0pjlfV/T2v8996rQXxkGTZbPpNwpcuUpbek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bV161Tgs4wSnzMybCdsPXiLVkj0ud2/om2LUNqGC1RA=;
        b=3VRsLXCT/sQRmInAbG/d5IL9zIH5Ti7lMTORnXqnL/KOYj18A/e7rSjVVDgH6B/E5k
         wyXFFhH1dVzXtu8CSPlOXJlGz/rHHysGYb2V2xrmwvHJD1tmO6HDcp+2XsNM1kvVBj7l
         JTaCCJgP4E/6s9Uft1Widu7Cih+Rjc44OLsSkLz0N9chZjARgFcM3QA8zYuynUICx9ab
         stWJ7cDZqVW0isnnq1/jpahhoYoH3xfGSzfBtCLCyu930f0Tpf3AmhJkLuGk3cIWVfZb
         FqAAb5r7+yXpi9kgcgp1FuKPT9ptBtGZzurHNsM2OgCrJ6wLmERqEC6UhqXNu4TyCIga
         B3/A==
X-Gm-Message-State: AOAM530EPvTeLD8Im+u0ZHiPqNqWiiHyfAcSKHlhZvU0dQo2+TYIS6mM
        RNpa929GNaKgy1FsR/4/m/1NNg==
X-Google-Smtp-Source: ABdhPJwh5SjYa4p7foq2MopnWWiswUTmgThs5HIPn+o8rdj7paxcik4BtfS1J70kzanuk0eN0WNGzw==
X-Received: by 2002:a17:90a:c58d:: with SMTP id l13mr16185603pjt.189.1635959817332;
        Wed, 03 Nov 2021 10:16:57 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:b5cc:11fb:70c8:786f])
        by smtp.gmail.com with UTF8SMTPSA id q1sm3256107pfu.44.2021.11.03.10.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 10:16:56 -0700 (PDT)
Date:   Wed, 3 Nov 2021 10:16:55 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sujit Kautkar <sujitka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rpmsg: glink: Update cdev add/del API in
 rpmsg_ctrldev_release_device()
Message-ID: <YYLEBxIUjlxz3Nhz@google.com>
References: <20211102235147.872921-1-sujitka@chromium.org>
 <20211102165137.v3.2.Ie09561c5b453a91f10ecc7e1974c602c4ff78245@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211102165137.v3.2.Ie09561c5b453a91f10ecc7e1974c602c4ff78245@changeid>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 02, 2021 at 04:51:51PM -0700, Sujit Kautkar wrote:
> Replace cdev add/del APIs with cdev_device_add/cdev_device_del to avoid
> below kernel warning. This correctly takes a reference to the parent
> device so the parent will not get released until all references to the
> cdev are released.
> 
> | ODEBUG: free active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x7c
> | WARNING: CPU: 7 PID: 19892 at lib/debugobjects.c:488 debug_print_object+0x13c/0x1b0
> | CPU: 7 PID: 19892 Comm: kworker/7:4 Tainted: G        W         5.4.147-lockdep #1
> | ==================================================================
> | Hardware name: Google CoachZ (rev1 - 2) with LTE (DT)
> | Workqueue: events kobject_delayed_cleanup
> | pstate: 60c00009 (nZCv daif +PAN +UAO)
> | pc : debug_print_object+0x13c/0x1b0
> | lr : debug_print_object+0x13c/0x1b0
> | sp : ffffff83b2ec7970
> | x29: ffffff83b2ec7970 x28: dfffffd000000000
> | x27: ffffff83d674f000 x26: dfffffd000000000
> | x25: ffffffd06b8fa660 x24: dfffffd000000000
> | x23: 0000000000000000 x22: ffffffd06b7c5108
> | x21: ffffffd06d597860 x20: ffffffd06e2c21c0
> | x19: ffffffd06d5974c0 x18: 000000000001dad8
> | x17: 0000000000000000 x16: dfffffd000000000
> | BUG: KASAN: use-after-free in qcom_glink_rpdev_release+0x54/0x70
> | x15: ffffffffffffffff x14: 79616c6564203a74
> | x13: 0000000000000000 x12: 0000000000000080
> | Write of size 8 at addr ffffff83d95768d0 by task kworker/3:1/150
> | x11: 0000000000000001 x10: 0000000000000000
> | x9 : fc9e8edec0ad0300 x8 : fc9e8edec0ad0300
> |
> | x7 : 0000000000000000 x6 : 0000000000000000
> | x5 : 0000000000000080 x4 : 0000000000000000
> | CPU: 3 PID: 150 Comm: kworker/3:1 Tainted: G        W         5.4.147-lockdep #1
> | x3 : ffffffd06c149574 x2 : ffffff83f77f7498
> | x1 : ffffffd06d596f60 x0 : 0000000000000061
> | Hardware name: Google CoachZ (rev1 - 2) with LTE (DT)
> | Call trace:
> |  debug_print_object+0x13c/0x1b0
> | Workqueue: events kobject_delayed_cleanup
> |  __debug_check_no_obj_freed+0x25c/0x3c0
> |  debug_check_no_obj_freed+0x18/0x20
> | Call trace:
> |  slab_free_freelist_hook+0xb4/0x1bc
> |  kfree+0xe8/0x2d8
> |  dump_backtrace+0x0/0x27c
> |  rpmsg_ctrldev_release_device+0x78/0xb8
> |  device_release+0x68/0x14c
> |  show_stack+0x20/0x2c
> |  kobject_cleanup+0x12c/0x298
> |  kobject_delayed_cleanup+0x10/0x18
> |  dump_stack+0xe0/0x19c
> |  process_one_work+0x578/0x92c
> |  worker_thread+0x804/0xcf8
> |  print_address_description+0x3c/0x4a8
> |  kthread+0x2a8/0x314
> |  ret_from_fork+0x10/0x18
> |  __kasan_report+0x100/0x124
> 
> Signed-off-by: Sujit Kautkar <sujitka@chromium.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
