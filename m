Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E65C04A6A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Aug 2023 21:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236408AbjHKVCD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Aug 2023 17:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236814AbjHKVB7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Aug 2023 17:01:59 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8C5E7E;
        Fri, 11 Aug 2023 14:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=/Jpy95QT2Gj0P5lCOqBdXXUs2+WPR8bargTYgOq+jIE=; b=tKzL+KVTlHYFtLvSuw1fpzMkAi
        Dow3493P0T+n8+qGJA7IrMXwCn7NFXJ7o93JSJtCNW5gcaD4lIGaThl5SPSmO56He5VbIrMGZWGfR
        kBwoUeGgIPT25AxvVRlZiAvzhJ4/6rJJsePtFPIhRcSJpOeFQvTE7QFDrMyVJs16PPKI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qUZGY-003qQb-CL; Fri, 11 Aug 2023 23:01:50 +0200
Date:   Fri, 11 Aug 2023 23:01:50 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>,
        Alex Elder <elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 2/4] soc: qcom: aoss: Add debugfs interface for
 sending messages
Message-ID: <d212e5a7-e9e5-4297-85fb-030818f7c647@lunn.ch>
References: <20230811205839.727373-1-quic_bjorande@quicinc.com>
 <20230811205839.727373-3-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811205839.727373-3-quic_bjorande@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> +static ssize_t qmp_debugfs_write(struct file *file, const char __user *userstr,
> +				 size_t len, loff_t *pos)
> +{
> +	struct qmp *qmp = file->private_data;
> +	char buf[QMP_MSG_LEN];
> +	int ret;
> +
> +	if (!len || len >= QMP_MSG_LEN)
> +		return -EINVAL;
> +
> +	if (copy_from_user(buf, userstr, len))
> +		return -EFAULT;
> +	buf[len] = '\0';
> +
> +	ret = qmp_send(qmp, buf);
> +	if (ret < 0)
> +		return ret;

Sorry, but you still appear to be sending binary blobs from userspace
to the firmware. This is not liked.

The documentation you pointed to has three commands. Please implement
three debugfs files, one per command.

    Andrew

---
pw-bot: cr
