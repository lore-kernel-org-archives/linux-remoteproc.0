Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD997DA62
	for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737995268; cv=none; b=pIWCZIT5XeR8yd+iEGOD3r2iJaWX/dnHmAITSkaL4jQp7IkZFIO+r8jSFP7Hw3UBHaa++FTr7MMs0ZsDE21MyOZLUHSH2re6Dyh6bdiQq7rc5wzwShTJYpaSiLhaRZXdVcjBRU2pZAgzGZ/7kaJzUO9veVL/623sudyKH4rYTDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737995268; c=relaxed/simple;
	bh=G80NDwexUckx30TKu0/BYWqvImmXaGich/yIkbRsaKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PeM5NgdjpCIUXLUl18vHcdfdT4KrqFIl67G6W2X135PR+3uwbKRp5xS8e8S+FO8Hm0rxAu1bwtJ39bPAEsiU2NTpH2nzOxpUFujjztkpWTxO7PythJdvZTYSyr0mW1pLpNGwjaaAwZbAw/OnYMf01wkyoxGBqI1xf/35cDuMDPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EUEfvq4h; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EUEfvq4h"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso958745566b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Jan 2025 08:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737995265; x=1738600065; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxRbu7frYGLzwM2+iFNAgQIZ02NmOP5PWZxJTtrk1do=;
        b=EUEfvq4h63RMv7sZpbKoM6M64PacpxAvPq+W7KZ3f8T5SxqO/Ns1BkJa1XLlGlUrTQ
         m9hac50DkD6lPaIphtxZ8iZ2xH10nmaF9evRESv4OzBoPtZVJz+I88Mc44j1zQt0LMJk
         acivl2N6ZrFRJNIuZaJumPjQXt185mcXelKU33q+vhKVatTnuhoOF5/4/F7pE67gOUEE
         rXMlBk7H2HtZPzrwgjTJ1rJSrOCO+FH0gtB9aEjlL2AfyThqUHpdlYg9vbnewP5LUgaC
         QOvs28+dbT0M8oQxUd7G4hsqNjvEv5GWD0nH7CggZVoDB7BtjcX3lMXohHSCvuzKZG3N
         bM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737995265; x=1738600065;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxRbu7frYGLzwM2+iFNAgQIZ02NmOP5PWZxJTtrk1do=;
        b=Xe8hnhs/n0E3iuHLcPLDt9TaCYpsLtotaYQUgH6jdk3CCPMvKk5ybRa3o5bVYVHMsc
         gyxoFTSByEskKeOkWZcQS49eD79vI4W3x/bjyiJMMBH2F3tisLuda0E7J577fbw3GDTb
         oPTphEkCaOvt64ZdvZO7iTOAdDisKOHgd27uMS8LJrbM7R4xsjnlJFK5quDrWk/8sonx
         61BlKZsQTJKontCB9pXWKmN/pngHfUhWMEH0WqytJ8hXNHdd2GRjwl1Zs0yf1IXvyHAr
         xWUo9fO2TF2MRm1d2YXCMJVigLG9ZuJsDT1qzX2zlPFho1SRV/5HM93JYesUrIWTmWsn
         AlkA==
X-Gm-Message-State: AOJu0Yz7pPDgMkXG8cUntvsOeSpa4RLxVl3MI57CxsgImXsswlprOnMI
	vBNHfWbInhrl9uYyG/iXF+yFu2H4nSVwo051Lc9JPFquN0J6MBpK4j//akUOjHE4ioatmppZApZ
	FEBt55j90KQiZ4cCBqsLHS4mMLMYY+SD5J65q6s3NSj2jsCtF
X-Gm-Gg: ASbGnctx/NwtVRy5TRcAKwY4EFwOK1znaa1UZ2pMsyDlQWaSCz/0O/rKUXP+dOVf9v4
	koSNnHkzyhAwBoGbHsZbgQmbJKahJ0KqsxtbirYtVsyQ3t4VhoVgb8AZkBLWCnVaFvASqyTe6/e
	9gsoCXgTJxoaE3KaR3iCCi
X-Google-Smtp-Source: AGHT+IF0RzlztgBpVFbhWlRB73WpvCKmcikdDxM38/ZqG2z8FeKmk3FeFsxnV+09UsxoDhrXq7Xe1C54PTve0rcYiJg=
X-Received: by 2002:a17:907:3fa5:b0:aae:ef24:888d with SMTP id
 a640c23a62f3a-ab38b48d9dfmr4066944666b.55.1737995264469; Mon, 27 Jan 2025
 08:27:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bc9f1dd8-92b1-4839-86c9-ac9e544648ec@maurer.systems> <1710b217-548c-4eab-a1f1-dd31cd7625e1@maurer.systems>
In-Reply-To: <1710b217-548c-4eab-a1f1-dd31cd7625e1@maurer.systems>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 27 Jan 2025 09:27:33 -0700
X-Gm-Features: AWEUYZlhbjy2HwUnXR7GVEXjN0m-oFM4i8YHCzIIGz_fwweY9xXmd0606g4a6ms
Message-ID: <CANLsYkyERtRf4F8DGK9-1=cztkA6Gz7-gUb5dGdaUO5ufBWg9Q@mail.gmail.com>
Subject: Re: RemoteProc over PCIe
To: Simon Maurer <mail@maurer.systems>
Cc: linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jan 2025 at 11:53, Simon Maurer <mail@maurer.systems> wrote:
>
> The last patch would be the first step for RemoteProc over PCIe. I use a
> Xilinx Zynq 7000 PCIe card as my remote CPU and a x86 PC as the the
> host. Both vrings and RPMSG-buffer are in the remote (PCIe-Card) SRAM.
> So the RPMSG-buffer isn't actually DMA memory, but the SRAM on the Zynq
> is mapped in a PCIe-bar. I'm working now on a patch, that transfers the
> ownership of the RPMSG-buffer form virtio_rpmsg_bus to
> remoteproc_virtio. So instead of virtio_rpmsg_bus calling
> dma_alloc_coherent for buffer allocation, it would call
> virtio_get_shm_region to get TX/RX buffers and on rpmsg_remove it would
> call virtio_release_shm_regions (new in virtio_config_ops), analogue to
> find_vqs/del_vqs.
> Thoughts?
>

Hi Simon,

I don't know anything about the Zynq 7000 but I assume it needs to be
explicitly told to act as an endpoint rather than a PCI bus master.
I can't say much about the above without looking at real code so I
will wait for your patches before spending more time on the design you
are putting forward.

As for your patch adding a new operation to the rproc_ops structure,
please include in the submission for the work you presented above.  It
can't be merged without an actual customer.

Thanks,
Mathieu
