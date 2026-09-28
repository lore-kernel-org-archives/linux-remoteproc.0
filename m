Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275464DEC26
	for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2026 14:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790607341; cv=none; b=N/WzfCZAJa1tgmNt+mRUscmoJJu8e0xAfG7rh6bAdccLUbB89SSVRXCq4YKq1dizbJ0xYwFsGjRjmWI3M9vtAuHzJBKRjXw3vEDz955+1pfUU+Vxuu8wqYDO9IpNDHAokJenFrMteZWdMVznTj2ifTQzM9imOv3zPaQutWXAFm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790607341; c=relaxed/simple;
	bh=CU0HkBGA+tWnISbdNXvlHJWhIkt/fCCiMdnnzNXvSpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KElkyJwNT9bHOVkuHsl+2K0WZqRwm8z0ePNayo3JvkGZw3mFN/3nm+sqOaQNBd0lOchby7B3Li1JzEED4S/Zwuws/6dGvVUGsO9OKTa3Pi5dzlLXxk0P/x89CMLDkjjoy9n85FtDd/0cbLnqB551dY0MUzFarVXm7tTSGTiWd/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7xEFyGp; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7xEFyGp"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93c5b7f5bfaso166068685a.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Sep 2026 07:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790607339; x=1791212139; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PFHQSNiI/deU+anoAMsoL0RautmW9OIvnnbT2VDLMI=;
        b=q7xEFyGpshL4IhzTKNSMB3o3Ug6y3OWMqmMiM4jB59or9plXIl+8AbbRWXQ+qGkY9K
         z3BxheaqTpIKjDFvuyoXaSbg/Y6yTlEnkjxVkwdH6fHCd3y4PZvewaTljNqFxGsG+B/f
         ktdq47HeURiHkUg3mVJHV6ao5KC6XmFMbHpS4B3N+b0o8a1V3V50/NohGWUilu1o0dUz
         QRQWfAMS6QZ8QA1/Sus39D29ZE54CaZKjgxQa5d0HtFn26KsHdXK26pHp4FykM3s1n2E
         05TXUy2HLx0FqjJADKxONdhKTVhHv0G1cbu/oC18Q4BHljEgpI+I+aTW1j7SG0j9pyMO
         OHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790607339; x=1791212139;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PFHQSNiI/deU+anoAMsoL0RautmW9OIvnnbT2VDLMI=;
        b=Z/BL1gM0cYp2QouJor7WneqCgNNFPalUIs3HUKGXzxBzqfJoaD61lYS3Vxrs+1p1wF
         UrdpGBxVOaAxAjVXXNPZH8DAcjhG/YbvdZibJwq1LvgY7I37bgmNb9PMc/A1STLV9fVY
         P9tkjlukQ1eT2XqQHYFbJl5vgNGMkkkQ+JZfzN2yfzfwrB1YXIHwwvK55JhHGmgTH0GT
         Khdik8E3sIAFQd4yMdWHxOGb+2XLJtJCe7TlbKZCdemImbQRkNwa9u2rclzPe4ZEE9DZ
         IOEVs5meo1+0ygBHnKC/++pT+oTESErbmy5lDqrpYV0joL0UdITPhTEzqQRJisYOXHIm
         T+kg==
X-Forwarded-Encrypted: i=1; AKwUvBzcHM6LpVgrLaBPX7qVcUFTibyjqxtKV/kkUanRIXkoDeLjlcwuLpSwjK3tF+PBQAgsqr6r5oi17jcGT3nm9sVI@vger.kernel.org
X-Gm-Message-State: AFuF++mj9kMHFiUpFRwMO04H6J+2oZ/XbW5RhkcQk0lyo1IJZCcR7jqr
	kvpKUPl9iPVFTwoTluK3Q1ZL2Rf5j4YBfNFYfgMVh2ijvuxQ3H/WHdwd
X-Gm-Gg: AYBFou0hfXelVsfP1djCInltPWKqkQcVCqmOvTgUOOAOvl0YSG7UoeeImU/yGNmMx9r
	la41CPbJniHVS+6ZW9M2gX/aKYAuZTpzNKnklc0xuglAia7jFNlwHayDGIO7Ej90haBXM8zQp/j
	wAWIdtXr00FSZ/Kz7K3mBqWD4o30zBGlVrxS79cLTI/15Yd41uzU/szJQsqzMks0GjbToIX7ijP
	aipL4zdmPwEdG4eT4MKIM18y9a6nCmlsNTnbR1jnpifyoaDTWb4qXQagAaYZNPFhEcFn6icqjU9
	N0XGY8jtA1jS6BS8PpA48latDQJW3gnTTcYNILViSStet/qoOR11X/taYruTYaMUgMHhfwV4GYa
	2gVKpIzEiVMpQyNRqmVekelxn6eyugnF350CgwrAu56PZNmz0Pml2I8/tuky5cgylka4276FuJJ
	o3nUY/1xtpQlRs41R7QtbbFLjCNZ0WzHJB62vBwCw+Uk3LmSxYw8ccsNZe1pwp9Zb37rh+tNeKR
	Sk=
X-Received: by 2002:a05:620a:1a1d:b0:93b:d88b:ee01 with SMTP id af79cd13be357-93c43dc1bbbmr1832913285a.34.1790607338944;
        Mon, 28 Sep 2026 07:55:38 -0700 (PDT)
Received: from localhost ([2605:8d80:6a29:8ead:1921:5a14:4db2:536b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c813cf1d6sm168115685a.19.2026.09.28.07.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:55:37 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:55:34 -0400
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 05/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Message-ID: <arp_5ts21rAgcr-P@rdacayan>
References: <20260922015801.32373-1-mailingradian@gmail.com>
 <20260922015801.32373-6-mailingradian@gmail.com>
 <58ced827-d6ec-49e1-9a2d-a4d5c4111721@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58ced827-d6ec-49e1-9a2d-a4d5c4111721@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 12:44:36PM +0200, Konrad Dybcio wrote:
> On 9/22/26 3:57 AM, Richard Acayan wrote:
> > The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
> > compatible for it, with the same data as SDM845 since the driver
> > requires the load_state.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index ca8e61254c44..5272a462fc49 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
> >  	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
> >  	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
> >  	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
> > +	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },
> 
> Would a fallback compatible be suitable here?

I'll do this next revision to avoid adding the constraints in the
bindings, but I think SDM845 will only have one specific compatible.
MSM8998 and SM8150 use different data than SDM845.
