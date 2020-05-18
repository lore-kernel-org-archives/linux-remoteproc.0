Return-Path: <SRS0=KI6G=7A=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E738C433E0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 May 2020 22:27:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5999D20829
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 May 2020 22:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DciQigMF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbgERW1s (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 May 2020 18:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgERW1r (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 May 2020 18:27:47 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924E0C061A0C
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 15:27:47 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x13so5594934pfn.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 May 2020 15:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QjsuewzhfZI6m+Hde5GIwD747MiEMVgDHLx6f9iIyuQ=;
        b=DciQigMFiKQBAI+nDrFox05gdEbOalXst4/IvZVKSbr97ysgLO3Jnr3C2Org/JRDMi
         zPkTpZL8gweMYiStFzBJUYVyLPGk6uO85DUDakpJ95uBUGtvgx77rWvjEwa81nvpf5m9
         zjgnynD9lkFsaY690XDl/nsyWgnp0EPXRP6Jh/qpj8BzBFqaDAP3mnXhPVSyi7WZwXgm
         CCswHh6+CPgxf/uT53rTYwIgMhL8BVYo1RzINNGxGEGFhlxZKZ4cZWWXeJZO4Ig90rDR
         Ciz6oqiMiwABYc1o2n2v0A7cw2q0hwc9OsOnTFonHD7xRIWNk45uyQIG3yzLhw51NQh6
         KlbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QjsuewzhfZI6m+Hde5GIwD747MiEMVgDHLx6f9iIyuQ=;
        b=Iz47/7kTGFA/FOQrUek/YM+JjY00DQ1fIwHuIkG9DNzbUXI4Nedp1EMUbhIt2RRwBQ
         DJgGBX6FeOyXg9U3MFspAorF1EhaEULeeSIhb+qc6I6WIoIN8QCKBYsOOhUlBmjZYili
         xlYuFgp6lG51HbWC9Zp7Bxt1lKlaCWJWrKQXuQbswbIxv1ug1RNKsdTP2YV0J8MCu0nU
         JViUEj90gNt6uhTa7Te7KKDpEA3GkhnSjnoiU+AzkMK6RL662Q3i3J2RM0XJgxbAPGvL
         XAo3ZUzfdJ9oNaqHm3kpt+hTF74PJNpw7TUs0PeYWA+9FPl5tiAVBRXXJ+sxoT2vBFhE
         9Ebw==
X-Gm-Message-State: AOAM530fNkvjkfLFn/XW4nhwzh4/4IyTOtozhaNf1LgFyP+jBaZDNX58
        E5sXakzOeDpoVZC5iz8cmbPqleyMwOM=
X-Google-Smtp-Source: ABdhPJwXQpma2Z97nvUZzKCu239hl460Tco5kUWtUE9yL/qcG0JvxSHuAv1T7YyKEDBFNvrp2Ipklw==
X-Received: by 2002:a63:ed50:: with SMTP id m16mr17808069pgk.271.1589840866953;
        Mon, 18 May 2020 15:27:46 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x10sm8268963pgr.65.2020.05.18.15.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 15:27:46 -0700 (PDT)
Date:   Mon, 18 May 2020 15:26:23 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Valdis Kl??tnieks <valdis.kletnieks@vt.edu>
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: wcss: Fix function call for new API
Message-ID: <20200518222623.GI2165@builder.lan>
References: <77652.1589836106@turing-police>
 <77864.1589836457@turing-police>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77864.1589836457@turing-police>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 18 May 14:14 PDT 2020, Valdis Kl??tnieks wrote:

> On Mon, 18 May 2020 17:08:26 -0400, "Valdis Kl??tnieks" said:
> > commit 8a226e2c71: remoteproc: wcss: add support for rpmsg communication
> >
> > throws a compile error:
> >
> >    CC [M]  drivers/remoteproc/qcom_q6v5_wcss.o
> > drivers/remoteproc/qcom_q6v5_wcss.c: In function 'q6v5_wcss_probe':
> 
>  Ignore this - was fixed between when I noted the problem and when I sent the mail :)

Right, I fixed this a few days back. Thanks for the patch and thanks for
confirming that it's fixed!

Regards,
Bjorn
