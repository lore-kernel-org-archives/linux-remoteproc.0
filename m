Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D603314A64
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766522119; cv=none; b=Spkp6Neu54yc0PhzHlfZyMIfyO9FqiM9oRcb1n0e3ky6eUcmMRe24fuYva9ZAZOhr8YNV5P8y4N1ckE0MBYfRyXXNj2ABBxSx6cDoZ3gBkCZN6/ZeJU7Y9Q8c0dSTce5BIf92QQ85ydF7IN2OcpMkOBlX+BuTFnC4IHWqVzmM1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766522119; c=relaxed/simple;
	bh=QOueJ1mRgYwmgJidNsqj0fULy188ozhjfLL7kXVZdWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IST0wzVKfwTOk2PDACorcW6RLGns2YTxytSHDXiLO/NmY1hR5mULRqI6TJQ2PyoRQFFn49D80KDk0+uC0mwQGUszFPERPC4zbAl4zgYbkLEFusq1GESLq49fr8/uzi5Sdkft6k1J1RC1W+jM8Ra25MgU0zKTRYC+ceVqd19efvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWZHdW5F; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWZHdW5F"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7c75dd36b1bso3925861a34.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 12:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766522116; x=1767126916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0uk5rbnTrDj6OgXv3yPUh1V1C8LXaBlzWsDnZOyRYEI=;
        b=EWZHdW5FEPVcqQmqE2ce8PDKUiN4UqEZIize/qiRSsG4jXZ2JI08qh0WNOGlcb0oTM
         D7PTRyUoYE5E+zCYrVuoaiQwTb7eSzqaw/7qF5NlyUysstIRJeIdgQsDdaC+pKM2oufH
         6ze+/fBRM79QilA6CXFHy9Euxu16QMg8hTIRDSaFhWPKwXnY9u3UdIyeI4FTBNzxn/lr
         qfsnku28Gl7EMbjoWsvuXUxqzCAipHpHMmICH6r84u4jjalS7U+4FkMNB75/heMyknoQ
         hFEbag+Me4oNVH33WhO4p3te2Mi/xU2tQF79CugKsOGIY0CtqPRgyOJxKxxqC+crP2qy
         WSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766522116; x=1767126916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0uk5rbnTrDj6OgXv3yPUh1V1C8LXaBlzWsDnZOyRYEI=;
        b=ZcRsAiztS9qup6S/+4jRR4J8HXxUzCUAKWfKH2Jzj5XJk4MmKVhmfLIW8OvsWKG7RF
         kgp2PbMZZIsU11kgGeRUYAFSzFDj0jO+FmQF53jm7z0q1JaFvtmF/oVRoO2WO6iKtH9j
         BaglvgggxxL+JKIoudQw6zhSeiRJAh9wykBU6NPt+TAeanYAKPy4XQOmds7jY0lTrC2d
         7jO9EhWq/Fv8mlbM++gWcdlXjU0yNZNxb+PYZQ7PXIvT1JJp7RXCRIqLNYXIfO6gjsZc
         6q50q3iMdaqviTi4P7PLZITlqAEf1kHxeBFVu+iffh+USOsqk2WPmoimce1QxweHG6NK
         Y/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+NRMaiMG4JLq5ogaaAVmQMYbnvn/MIQIlFK/eaxpSYiyuLB0i8BCUkKMoAYKKj45UeHWC+MIhZkEUD1tG78Lh@vger.kernel.org
X-Gm-Message-State: AOJu0YxoWdlmZMIQMgUK1in0SPGrfzjZ2OHhwx3efTrUqdrYoA4apjiF
	MwGEmhx1LnWb37gG+FX7ylNbrXNvaRuQ/AbelPfLbDFmJ59UDncDx0IqT7esuA==
X-Gm-Gg: AY/fxX6f2tPSV6tB2IBjofleNpR0mp364fHAvfoERUou5xC6guHTvfx9cqJU7ihrAQp
	HTgW6bID1VuV2SXG88TqTfObMwJSVQ8wFfvN1wD4hOLxKCCNb3jZcYewnHzYD5qVvJtXYGLsmSY
	n0I+fC6ri6ASkwx29/uUTYJRCn1WsxBfsw77HabRE/HpGTe7oGvj8j0vqIXUDwR9irj05afTLpE
	YdOI3deMTiYJr0qNrqvDMIpiyb3SiE4Gc8Vt2tCjecrX+i1glBcxFCii11JiOjKih+UmseyoRYd
	ro53uLYtsZhP3sF98wUoMEZ7v70lDKcfy9dbeEEPm9kcMBZxYvRgZMaESp22sW67mgrRqqG0cEj
	UweoAEZbRMgN/D9SKKKG3DGOGTfNhYawNFjtUZ26Tqy4dP+2H3AAe5pRY5Z3RA68mB04jZk3FIA
	rFq3/yWJgH+mEyWT1PTPDajOxVYkCTl7M68NZvgcXjp16i8pio3C2ZWP1G8WAlBsdhGF2RKE3HE
	dtgWICNWpZPT/cOsWw6OSqP6qCWl3g=
X-Google-Smtp-Source: AGHT+IHyErY0P8ecU1HiiChzO9n89IIYBESftCKQJd7X7/dItVzyCNpRjo4JbYfClhw5F35/fWnswA==
X-Received: by 2002:a05:6830:4103:b0:758:1417:7ee7 with SMTP id 46e09a7af769-7cc66a0b453mr8289822a34.5.1766522115974;
        Tue, 23 Dec 2025 12:35:15 -0800 (PST)
Received: from nukework.gtech (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667d571dsm10065971a34.17.2025.12.23.12.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:35:15 -0800 (PST)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, krzk+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/9] remoteproc: qcom_q6v5_wcss: support m3 firmware
Date: Tue, 23 Dec 2025 14:35:14 -0600
Message-ID: <5116928.iIbC2pHGDl@nukework.gtech>
In-Reply-To: <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
References:
 <20251219043425.888585-1-mr.nuke.me@gmail.com>
 <20251219043425.888585-7-mr.nuke.me@gmail.com>
 <5b9cd24e-7eae-4cbb-b013-6ef135902ae7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday, December 19, 2025 7:29:07 AM CST Konrad Dybcio wrote:
> On 12/19/25 5:34 AM, Alexandru Gagniuc wrote:
> > IPQ8074, IPQ6018, and IPQ9574 support an m3 firmware image in addtion
> > to the q6 firmware. The firmware releases from qcom provide both q6
> > and m3 firmware for these SoCs. Support loading the m3 firmware image.
> > 
> > Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> > ---
> > 
> >  drivers/remoteproc/qcom_q6v5_wcss.c | 44 +++++++++++++++++++++++++----
> >  1 file changed, 39 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c
> > b/drivers/remoteproc/qcom_q6v5_wcss.c index b62e97c92d058..265010c5c82cb
> > 100644
> > --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> > +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> > @@ -101,7 +101,8 @@ enum {
> > 
> >  };
> >  
> >  struct wcss_data {
> > 
> > -	const char *firmware_name;
> > +	const char *q6_firmware_name;
> > +	const char *m3_firmware_name;
> > 
> >  	unsigned int crash_reason_smem;
> >  	u32 version;
> >  	bool aon_reset_required;
> > 
> > @@ -161,6 +162,7 @@ struct q6v5_wcss {
> > 
> >  	unsigned int crash_reason_smem;
> >  	u32 version;
> >  	bool requires_force_stop;
> > 
> > +	const char *m3_firmware_name;
> > 
> >  	struct qcom_rproc_glink glink_subdev;
> >  	struct qcom_rproc_pdm pdm_subdev;
> > 
> > @@ -922,11 +924,40 @@ static void *q6v5_wcss_da_to_va(struct rproc *rproc,
> > u64 da, size_t len, bool *i> 
> >  	return wcss->mem_region + offset;
> >  
> >  }
> > 
> > +static int q6v5_wcss_load_aux(struct q6v5_wcss *wcss, const char
> > *fw_name)
> > +{
> > +	const struct firmware *extra_fw;
> > +	int ret;
> > +
> > +	dev_info(wcss->dev, "loading additional firmware image %s\n", 
fw_name);
> 
> I don't think this log line is useful beyond development

Remoteproc driver prints the main (q6) fimrware name, so I thought it would be 
prudent to print the names of any additional firmwares:

    remoteproc remoteproc0: Booting fw image IPQ9574/q6_fw.mdt, size 8140

> > +
> > +	ret = request_firmware(&extra_fw, fw_name, wcss->dev);
> > +	if (ret)
> > +		return 0;
> 
> return ret, perhaps? Unless you want to say that "it's fine if the M3 image
> is missing, particularly not to impose any new requirements on existing
> setups". But you haven't spelt that out explicitly.

I intended to not abort when aux firmware is missing. Maybe the better way to 
handle this is to check for "-ENOENT" in the caller instead of return 0 here.

> You also haven't provided an explanation as to why the firmware should be
> loaded. Is it necessary for some functionality? Is it that case on the
> newly-supported IPQ9574?

I don't have a good answer. I reasoned that since the qcom provides it [1], 
the M3 firmware would need to be loaded. I haven't done much testing without 
it.

Alex

[1] https://github.com/quic/upstream-wifi-fw.git


> Konrad




