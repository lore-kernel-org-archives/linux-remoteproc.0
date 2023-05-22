Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CBEC7EE2A
	for <linux-remoteproc@archiver.kernel.org>; Mon, 22 May 2023 07:55:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbjEVHzj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 22 May 2023 03:55:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232777AbjEVHzS (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 22 May 2023 03:55:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F8AF1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 May 2023 00:53:36 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2af30d10d8fso18583661fa.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 May 2023 00:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684742015; x=1687334015;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HRWPQ1JYR7rxT767Hx6VFuo4p3kgPx9SeYKiNWof2ik=;
        b=v/0VfxgD5vAPv/y5W7DnzgGWqmrhDvQkEf20EgVVMBtW/Y08y+fAU0GYOHKwQokSQc
         jLMc7OCrmwCzd34wGk5cynVt/MfhE1gQqeEBzqAjRJUUVlGJ12mOUkGjiLYu9GzLrH4/
         VvpMCyCgksfwf5UCAf/XmQ178ceMxZVwBByqfO1df9JDjNjCnFyOx9UO+QXa3v+9CzMt
         h+Qon+aWJbFuf4CS02zPQx+UzlvOLmDgHC5aQlYFvSyjtIq/QZQSQK05iUoFk8Rqze0n
         qcQrm0my8zsCdupiTnAKCywtUWHnjQlVfOrfTLjAByGrjDkvdv0hvNO19pm3nZgY7mJx
         DfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684742015; x=1687334015;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRWPQ1JYR7rxT767Hx6VFuo4p3kgPx9SeYKiNWof2ik=;
        b=kRhcJ+ZJkjrbtD5guE+iMEw0rgDPnEtQXzJseoaplmw7+k0EBqcyOmokhLez065FOj
         TSdhcRkJp2V084tY48MXAagJ75qYlfe6a4GJmO8IheMjefezTTrCzNZj3xAnqddt2mjj
         g+l1XNdusrPn8eXEZII8IrNiIL67zr6qMgHZaveD94FW5HqNMq9DbRVU/gRn0bZ5lT5Z
         nqCGZ7X+LkU05fxgYknUT6LMgRAjRwhX7hrrjgxP1XUhFlQsiM8DB/H3zpfoe26kcU2T
         GdA9ovBhoyqieJA8IfdciM2lPtimJvL/6o7WUgSs0ykuISt9PlJTZOMjsjqqFaElzS8u
         pfDA==
X-Gm-Message-State: AC+VfDzH5V2n001/E5QsI2m5zbwma58A9O9+Qi8YR2KSRM5OJqhx6p8y
        MccLifCywha35rdf16pVwLWdF/4CLpa5Cl4KI48=
X-Google-Smtp-Source: ACHHUZ5jGLr5ZkNOpPGKF8ZrWHCcybQ2ho6XJK0XoN6Fxa4KXslUK35FJTi2aHp/q5ECehdLWpgP5A==
X-Received: by 2002:adf:fdd2:0:b0:307:8e50:34c6 with SMTP id i18-20020adffdd2000000b003078e5034c6mr6604488wrs.52.1684741592753;
        Mon, 22 May 2023 00:46:32 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i12-20020adffc0c000000b003063db8f45bsm6773775wrr.23.2023.05.22.00.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 00:46:31 -0700 (PDT)
Date:   Mon, 22 May 2023 10:46:26 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     rogerq@ti.com
Cc:     linux-remoteproc@vger.kernel.org
Subject: [bug report] remoteproc: pru: Add pru_rproc_set_ctable() function
Message-ID: <2dfa4582-9a0c-4350-8ecc-33c9247aad12@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Roger Quadros,

The patch 102853400321: "remoteproc: pru: Add pru_rproc_set_ctable()
function" from Jan 6, 2023, leads to the following Smatch static
checker warning:

	drivers/remoteproc/pru_rproc.c:326 pru_rproc_set_ctable()
	warn: variable dereferenced before IS_ERR check 'rproc' (see line 320)

drivers/remoteproc/pru_rproc.c
    316  * Return: 0 on success, or errno in error case.
    317  */
    318 int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
    319 {
    320         struct pru_rproc *pru = rproc->priv;
                                        ^^^^^^^^^^^
Dereference

    321         unsigned int reg;
    322         u32 mask, set;
    323         u16 idx;
    324         u16 idx_mask;
    325 
--> 326         if (IS_ERR_OR_NULL(rproc))
                                   ^^^^^
Checked too late.

    327                 return -EINVAL;

regards,
dan carpenter
