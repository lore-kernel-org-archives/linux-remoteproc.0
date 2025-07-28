Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63895266565
	for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jul 2025 14:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753712046; cv=none; b=Wr9R6PZ+3ycXgv/BSICkIN1jH6g/WYe9gDkltGRwUZLEiTBuXGBDINRdbEf+Z+HeHmVW/m5bG1gRKVcIctrmsnq9ww1Qaoggu+ZHLp21B8POStaEwrmqRyuHsdgEMXMfbkW4a5I2bNRimHZYPoPzst5yIArOcj81ziMKb58Ifbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753712046; c=relaxed/simple;
	bh=g45KzbwgBA7e0spemcISRrjUGP7tGUQ7fGO81mfXqk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SM1iscXEa1yRk6Lz7FOexrPANGjN+3Oy5HReMWbG6P02SVSw56TTNnbMsfilXuIHCXsmAKzHhRKe4MS6hNYrfq2qlO8ImyIOB2bCZdW7ajN3wB8dtc/MmdVFJZ9bw6i4dU0yYzq3UdqhkSx3VfEC/RuIgWJX8mPtqLox6P7TAx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cchhokgs; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cchhokgs"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74b54af901bso2878389b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 28 Jul 2025 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753712045; x=1754316845; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VkRksZeZRdJUhfD+fysrVUZxN07ubnU6SAGQQ5LsnD4=;
        b=Cchhokgsch93syKkeSWdM8oLlX8eQAJ8c+DhP0MaKIZX9Zy0zIQpGyWhROHwoob40q
         rCwDuQG2VSB1/8p/Lhn/xYPKQ4UCMHKUleTfIdmmJsbLsPX28DR54CVqwINT2OjYVfp/
         w8THvE4A8qYArT4nA0DCs4Xj4m84odVpy+MMLsbHXrRyF88ExeuvaxZn34efqpTaUD7H
         D3z/s7Imi8AHCvgJTECJi0QQY8cEaNXhoa2kjNgtuj6bgrAaFQ05/J60l3qpxHs/evLO
         DMS5tRJrLGHCw0GM6Sf2W5esB3TlVhhxT9WGn7EIxPIjkzwpLcjzMBjP3ikj2GQ/FP1A
         LgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753712045; x=1754316845;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkRksZeZRdJUhfD+fysrVUZxN07ubnU6SAGQQ5LsnD4=;
        b=U9yZbMFwkf94gNx3P2cDfMWer8ISdbHW6DmM2p2FdtP/yPrFieQqldk0ezGb3Bg1ly
         J0ajWy0jtZnmA+WUz67wuWRLU4fcUcpsIu7NjVRjVR/XCCm6CWwz6tPOiTaJXNp0KdOT
         qDRBeafK7vqz2djVwqMTYfhww6w3EkW5IPMwYKFLf0OAAdBjSdzsrCc9TGty5s1lE7Q3
         om87Wo1r4s+n0BBR19z99ITHXsBob8YR3iTdbP9nhEiLeu70iSJK7fvzjuG6AZW+en/E
         gPvQx/PIY5AYL48VjeEd3UsUivPixYIOx3nCvrjqpXwGmbPxmSOtukNMKjH4dPs6HxAQ
         +uSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUL7wfxFzldNthpTL2G32e+KpEyLzVYmooq4NaasMrdkU9RE2H+tm8r36LTIrgiyqa9u2f34BU47ed9R8Giz4x@vger.kernel.org
X-Gm-Message-State: AOJu0YxHzAbS475D5Ne6BEykfYub445SV1vqqf+WrS9Dbo/OOkhcLkZu
	7Wf6Z4QOT1+unj7trDOmhdf+CXA67WVASgZnBkOaTpg+AIMpxtCDOGWEw+/uhEKvyIY=
X-Gm-Gg: ASbGncsnFo5h/i11/MeVNLxeaP/t/MJyXvVwrerIzDBMY6pP6YhFuWsCpMhIcPbVDox
	hXncTVoFjAexmz344wJzLT99GqXDdSTVdJzQujZAvC97QSB+loIhbYWTWoMTTEs8vmsXGQd1wIr
	a7WjTyzZ8eI/K2H0WB95bqiA7tk11ZyS/sGiSayMoRSfABo505bBMsZ53yxw5S5bbCGkfxUwxpu
	QJXa3H1msi512pstbzAQ6t51RQXF3n+MI7bxtlcUThcR9+4qjwq5qP64++P1OrXBk2bpAnz+KDZ
	+TEGbIdl1JOO40q/DwHM7YVcHIdA1ZQn2p+OnB9206LYL94WTRWDHCUgfKNsaq4ug/v1c2px7kb
	BiqIwFUlyPU3saps2gCVkKFcRAhg9liuSp9Kr
X-Google-Smtp-Source: AGHT+IEzYHk+WznmPpX9Fulm4uS2KRvmZT0lrK8OW5a60R5q4nnqwgfy/r5C+L542XQYKAZbclCwBg==
X-Received: by 2002:a05:6a21:3d95:b0:23d:ac50:3342 with SMTP id adf61e73a8af0-23dac5033femr345980637.38.1753712044666;
        Mon, 28 Jul 2025 07:14:04 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:82ce:5506:d365:5bcb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76419d84234sm5604059b3a.57.2025.07.28.07.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 07:14:03 -0700 (PDT)
Date: Mon, 28 Jul 2025 08:14:01 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andersson@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support of recovery
 and coredump process
Message-ID: <aIeFqVUp2C6fh4PT@p14s>
References: <20250722075225.544319-1-shengjiu.wang@nxp.com>
 <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEnQRZBc2X6Yn0X+RbJ9-OSxovnHvoqJ3NXsJKBkuH82GNSAHA@mail.gmail.com>

On Mon, Jul 28, 2025 at 01:39:38PM +0300, Daniel Baluta wrote:
> On Tue, Jul 22, 2025 at 11:16 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > When enabled FW recovery, but is broken because software reset is missed
> > in this recovery flow. So move software reset from
> > imx_dsp_runtime_resume() to .load() and clear memory before loading
> > firmware to make recovery work.
> >
> > Add call rproc_coredump_set_elf_info() to initialize the elf info for
> > coredump, otherwise coredump will report error "ELF class is not set".
> >
> > Fixes: ec0e5549f358 ("remoteproc: imx_dsp_rproc: Add remoteproc driver for DSP on i.MX")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> Changes looks good to me:
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> 
> I've tested it with Zephyr synchronization samples inducing a crash
> via debugfs interface. App
> can recover correctly.

Very good - I will merge this around 6.17-rc2 when I get back from vacation.

Mathieu
