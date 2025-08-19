Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1382877CA
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 14:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615317; cv=none; b=FZecvp8uor9AmPIdJW6HK8V5OOWpJOup1mM8ZYZEoPPlPOyjz3gg/DcC6ka8w/78eob5JzhyrVPzTMcsiuhWhEjYsa5bVHJi8UqFwchErQ6fsVvHSznr4qQOvc28s4cBuGzbCSXPfdEZGvUvGnPOK/jMaYWEdkNSWSbMqJqN8Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615317; c=relaxed/simple;
	bh=JSgFReGmJrpsECohN/zB+vEQB99t0iIxycbYjj3gxhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gbiyDvNCTgGcxloHKVqDBPjhqPz/d0hKWOLVF1ehwlgDRUn6xOkuVPpaOsNbUQkz66CQapz+1me17kpq7rltj4vFZEIpI6kLb83fbb/az3SMpbquRRAvrERMxfKlApS8inrhM480REXkr3CQ8ibzxOuDn9yLRr5SV8J+FzAVR7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gC+iDL6s; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gC+iDL6s"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-618b83e5b27so4575046a12.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 Aug 2025 07:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755615314; x=1756220114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6q1VFKJc6RwiYJWPiwiME4ulyKyXCWSmhPscu25fEio=;
        b=gC+iDL6sQDl/2TwG5l13sEF1ye2gBaOnguKNDAFMonmSlsmmIXevZ2Vq0m0lkUpdA/
         fRQfz3VnrVn7U6h5jHiwNsOQQYY3DSYGUgwEitimagb9sXNmzENeYGeWseltorBm/r2B
         Roqm7XgGp0EVZpBawzAEQl1+4Nqa/4IEKSgB2qDIiUccRx0weG8YVLsQd7xJAu/cbnYn
         qxNfQFKSoomNKQLlyJA5hHasQO2+JbhSWUhlVQFE6GdHZa2eC33qgs+sIWd3tXwbdAvf
         BXPqmkQtl+/G/RO0MDT64CubwVuWUDkbWyJ5F9LSowvCJHTugMI0gBqsjGTW6bOEEluK
         fIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755615314; x=1756220114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6q1VFKJc6RwiYJWPiwiME4ulyKyXCWSmhPscu25fEio=;
        b=MZ9Z9JAJQlpqkqDGATlGQTcSfepIVGzBb48AnuyBKSkv2ff/1fuSgw1SH6CfSq0sLR
         p/uWv8Fep2v1dQjJQEBV763JSitug3EQH9WqFCMdF5GGEiowk+sMq2AgLzug3RJsY1yk
         zHbTvmHYIJJfazlHs3sr7JN54PGzbnkkvH5ee4DT2GRIz50OW5U7QITGO22bLfrcQPlJ
         cB6gSo+kz/zjs1bghpL7EtmFU3eretJHo9dXyTzaj1/NZEGg65EZaJYRJqQaMAigPGoG
         4aQ/UD5TLMJJ1KFZrksKvzJu5JdRcGO2JQHbJrpzfUaGrbGEl0rIswSpwhATDPN255PN
         wEZw==
X-Forwarded-Encrypted: i=1; AJvYcCX11pfE2u4bYG7Ulo94yLy3ElTIpSh8zaFntfJyh38gUcdeR4+z0KumIW5gY1XMU0yJFYccaMzpqx8/SSv7B5J9@vger.kernel.org
X-Gm-Message-State: AOJu0YzC5PQrLy+Kzm8z6E1AjrZGoVqBu9szsjg85+/F935gC2iRWLOv
	VMRsmJpOWn86Ikmx4dk/cKofVnE82AigViLYrgwI6v2toVbt/ayuiFGQudsCbgLrIr8=
X-Gm-Gg: ASbGncvCxN2rDA1GXvFL4aGcQ7JdVN0y8ilyqeZ/dfvPadTXy8EHiemGzZsRX7CLrM7
	49M6H81JVWB23Ti+2d+d6RwheSJTmYA0r5noa8c3hpcnhOs9LuUBooq00c1INJDZQ2uP9+LX7E9
	MEF21Qb+IRAZoQWcN3NfXTG8Jf7N6phMb8LE+pwpDqGCI/o4kM7qb3rS6E8cbA0kHr4Ic2WJFM9
	ncbJKJFKWgjpI8+coW0N+13EhBGmCCwzuGAUl8BdTlu6Emf4Go5rdEaKE/l5UipwYeK+1/XREOG
	BxewVfSr+wV5NGRW9cUvJ65/o8gbcWHlv42LPyngrQL1GFxnJIzb289L7piRQWsZclD3HHf/2Al
	Ae5BZ61Z9JaAnMBKm71c0dr7oPOKeBuk+dwo=
X-Google-Smtp-Source: AGHT+IHNXoZ8D6hcxitye6J8bRF474YdeJVlKpCXwByDHr/6U1kxp1SPdwBXlJC/jHhgrW329Z5ICQ==
X-Received: by 2002:a17:907:9486:b0:af9:8c20:145b with SMTP id a640c23a62f3a-afddc96119cmr295145666b.10.1755615313778;
        Tue, 19 Aug 2025 07:55:13 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:3ab9:939f:d84a:b5f0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce54021sm1009078766b.10.2025.08.19.07.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 07:55:13 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:55:09 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 1/3] remoteproc: qcom_q6v5: Avoid disabling handover IRQ
 twice
Message-ID: <aKSQTc5u5AePWVwj@linaro.org>
References: <20250819-rproc-qcom-q6v5-fixes-v1-0-de92198f23c7@linaro.org>
 <20250819-rproc-qcom-q6v5-fixes-v1-1-de92198f23c7@linaro.org>
 <czaabkgp3aerp7fntqnpwgilipnum5vmdwwrkem5mugcs7vvd3@q2mwq6ijfbmt>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <czaabkgp3aerp7fntqnpwgilipnum5vmdwwrkem5mugcs7vvd3@q2mwq6ijfbmt>

On Tue, Aug 19, 2025 at 02:44:26PM +0300, Dmitry Baryshkov wrote:
> On Tue, Aug 19, 2025 at 01:08:02PM +0200, Stephan Gerhold wrote:
> > enable_irq() and disable_irq() are reference counted, so we must make sure
> > that each enable_irq() is always paired with a single disable_irq(). If we
> > call disable_irq() twice followed by just a single enable_irq(), the IRQ
> > will remain disabled forever.
> > 
> > For the error handling path in qcom_q6v5_wait_for_start(), disable_irq()
> > will end up being called twice, because disable_irq() also happens in
> > qcom_q6v5_unprepare() when rolling back the call to qcom_q6v5_prepare().
> > 
> > Fix this by dropping disable_irq() in qcom_q6v5_wait_for_start(). Since
> > qcom_q6v5_prepare() is the function that calls enable_irq(), it makes more
> > sense to have the rollback handled always by qcom_q6v5_unprepare().
> > 
> > Fixes: 3b415c8fb263 ("remoteproc: q6v5: Extract common resource handling")
> 
> Didn't earlier versions also have the same behaviour?
> 

I don't think so. The "extracted common resource handling" came from
qcom_q6v5_pil.c, but q6v5_start() just had most of this code inline in a
single function [1]. The handling of enable_irq()/disable_irq() through
the goto labels looks correct there.

Thanks,
Stephan

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/remoteproc/qcom_q6v5_pil.c?id=0e622e80191e75c99b6ecc265c140a37d81e7a63#n795
