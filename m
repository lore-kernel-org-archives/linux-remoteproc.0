Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A62D47EE
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 09:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758534822; cv=none; b=M8B3r9ffHu/7Vowi25LWPDdwdb1bBd8g5jnTDaQ80FK8xa4Z6cY7Fp1d8cvu30BefsKLdQ1s8z2oeZgYpBw9U4FjJw3gKd9nLfb+4d/W1KGh6KXAzV3eVDTdyIAmXbpYXtT8xN76eDFp8nlG5BH3jtBiNVdqRz//57JtuX77Hpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758534822; c=relaxed/simple;
	bh=esO3W/fuZP482eU0DbboEi144GMIUIsmjt1D9wR9JM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EALjnn+MGh3hmkCVDcIMLPqQCuuZ/1P/S6OiwArvgkTUlC7xTseqAK+DMQmXV/ujS7tzfJjc4+FTiXnyjLh19uEkDp1kJRURVycD4Xfc+kY8sKbJxqrEN2Ux7S2tAu4gBKlbxdCJTTaKE6XGfaaefaKPiBfcFEWpeVyCQuS2cn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kynlIepj; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kynlIepj"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-62fc89cd630so4103507a12.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Sep 2025 02:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758534818; x=1759139618; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/IaYPEf/pbj+gCoDVQxBl8rQXBwRDj2M+SqF+hLZWJw=;
        b=kynlIepj03GkgF60hGM47GRSEdRn5oQ/gY4K+dW7K77MJhL354pXaP/pbotRL1tcvf
         Nfiw9Q0Jq4Pge5/1yXyQd2JPKotuIeJ3UAHsK5nnK18IVDD/qzjevX4m995Zy8sQATXu
         br9yV6Lu2O6Q70a6jKeI21qzdr0GQcusZfIGzQzM0r9AzLdxB0miyWFomPy2SbmoQcis
         epWnrzu+0q2+uLhTF6tH9w+d3SwACzicJevaPoZreMobstTGk0VPmZ+pO6oKVE5Je3o4
         UpckJd0cDgRZf8WN1YPppv6GiUZ5IJsYPVnrkPHP1MYfTF6ilNNDZfrd48S1qWgpwYuf
         Q6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758534818; x=1759139618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/IaYPEf/pbj+gCoDVQxBl8rQXBwRDj2M+SqF+hLZWJw=;
        b=Onlp0oLWQaU9uyNiI0xcbJNydvZ5Z/yWdqdcb3Xl9wHseiSOkx/zjSmzT5dZwAgle3
         tn7BQExe4nUKpeBNvfKc8OtAZiPWIm8bbFolBvjNMxCDxFaNwJ86Qa0NQKXt34GmuNyo
         J8Nfea3ngwBbBorKuf8Cmpuei82sAONOvuJnpwmvqZ1QYWxDJkZqMzeL6HRF3ii6nOVw
         A/dlMYj8Ptf6Xg4GYlmKIR5jv6e0+A/ahqqhK2eVBz4I/V1XnWygYtD4UBUYBkyzEKt6
         FQTedFzAetlYlczneEVYZ6wap8E9g/21+5pNVji0vRkeXoNV3qT2pR34uZIMpHDgdSpJ
         dCvg==
X-Forwarded-Encrypted: i=1; AJvYcCWl0OnKpTQQxq/Mb8BligWBaiAwuK3DKbiihiXvMfaEY9d8JQ0u+NwD0JnE7vclUP9ZWVGijrazqcoIqkpyvFP1@vger.kernel.org
X-Gm-Message-State: AOJu0YzINdodDp7NBQD6IyVIasFV7P9T0Gz5c70hPodsCP6ysSBGhaAu
	opfCvokpbaV/i3FVkEU2U5XueVxwZkpPBjulNcaZKcUJ4HbnQSSPA2AIGhKD2bSJyTuI3PNPnLt
	loKIRkjNoBg==
X-Gm-Gg: ASbGncvyF2mIB8myr1QwEFevNTLeundummpmqPxq/hsCwh29mijYWmaNoIpNUlzhc0u
	hc7ykKVyxt1yeMZ2nmxPgw8tC6Fh7LkNZlKfRBp/AH/H+gvwTFIfyG6+jwDVH+MdLLxjCDZirLg
	7WG3g2lwLzm0s5Hjk7z+og1plpduNfZCUs5787LAPgUwP8HVgqpQSU+bdCVpQ6hF75lpGLWZ/aT
	hMiCFRDcC1Y3vCQEnn8VVDVo/LPhjX7hJlyPLllKsmVF2SjFbCwzQTD8VutkvguhY4XqeFVFhtE
	8W5JWc8S24wVlY+Q4M8IABMXM1lotw64/55BODnuVfpu+lPjD24sBJY10VKXR+2xd65+STRyJvJ
	TqLy3LmD837uoq5kR2paM3CSdyRgXRKi7
X-Google-Smtp-Source: AGHT+IHiKebblXW/kEcmJLdU3y168juWw+BO/YJP4zZFl9ZrT9ZMCyQFGQs+TKWjudRMYXZg0Yy7Eg==
X-Received: by 2002:a05:6402:1d50:b0:630:716d:88c3 with SMTP id 4fb4d7f45d1cf-630716d8abemr6560526a12.11.1758534818269;
        Mon, 22 Sep 2025 02:53:38 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:26e5:87fa:fb57:1680])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62fa5d1a89esm8525144a12.16.2025.09.22.02.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 02:53:37 -0700 (PDT)
Date: Mon, 22 Sep 2025 11:53:34 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v3 00/12] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <aNEcngb2T62HYlMq@linaro.org>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <aNEEglLZTJuR1sLi@linaro.org>
 <20250922094732.6tupym6ulroctm5m@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250922094732.6tupym6ulroctm5m@hu-mojha-hyd.qualcomm.com>

On Mon, Sep 22, 2025 at 03:17:32PM +0530, Mukesh Ojha wrote:
> On Mon, Sep 22, 2025 at 10:10:42AM +0200, Stephan Gerhold wrote:
> > On Sun, Sep 21, 2025 at 01:10:58AM +0530, Mukesh Ojha wrote:
> > > A few months ago, we discussed the challenges at Linaro Connect 2025 [1] 
> > > related to Secure PAS remoteproc enablement when Linux is running at EL2.
> > > 
> > > [1] https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> > > 
> > > Below, is the summary of the discussion.
> > > 
> > > Qualcomm is working to enable remote processors on the SA8775p SoC with
> > > a Linux host running at EL2. In doing so, it has encountered several
> > > challenges related to how the remoteproc framework is handled when Linux
> > > runs at EL1.
> > > 
> > > One of the main challenges arises from differences in how IOMMU
> > > translation is currently managed on SoCs running the Qualcomm EL2
> > > hypervisor (QHEE), where IOMMU translation for any device is entirely
> > > owned by the hypervisor. Additionally, the firmware for remote
> > > processors does not contain a resource table, which would typically
> > > include the necessary IOMMU configuration settings.
> > > 
> > > Qualcomm SoCs running with QHEE (EL2) have been utilizing the Peripheral
> > > Authentication Service (PAS) from TrustZone (TZ) firmware to securely
> > > authenticate and reset remote processors via a single SMC call,
> > > _auth_and_reset_. This call is first trapped by QHEE, which then invokes
> > > TZ for authentication. Once authentication is complete, the call returns
> > > to QHEE, which sets up the IOMMU translation scheme for the remote
> > > processors and subsequently brings them out of reset. The design of the
> > > Qualcomm EL2 hypervisor dictates that the Linux host OS running at EL1
> > > is not permitted to configure IOMMU translation for remote processors,
> > > and only a single-stage translation is configured.
> > > 
> > > To make the remote processor bring-up (PAS) sequence
> > > hypervisor-independent, the auth_and_reset SMC call is now handled
> > > entirely by TZ. However, the issue of IOMMU configuration remains
> > > unresolved, for example a scenario, when KVM host at EL2 has no
> > > knowledge of the remote processors’ IOMMU settings.  This is being
> > > addressed by overlaying the IOMMU properties when the SoC runs a Linux
> > > host at EL2. SMC call is being provided from the TrustZone firmware to
> > > retrieve the resource table for a given subsystem.
> > > 
> > > There are also remote processors such as those for video, camera, and
> > > graphics that do not use the remoteproc framework to manage their
> > > lifecycle. Instead, they rely on the Qualcomm PAS service to
> > > authenticate their firmware. These processors also need to be brought
> > > out of reset when Linux is running at EL2. The client drivers for these
> > > processors use the MDT loader function to load and authenticate
> > > firmware. Similar to the Qualcomm remoteproc PAS driver, they also need
> > > to retrieve the resource table, create a shared memory bridge
> > > (shmbridge), and map the resources before bringing the processors out of
> > > reset.
> > > 
> > > This series has dependency on below series for creating SHMbridge over
> > > carveout memory. It seems to be merged on linux-next and pushed for 6.18.
> > > 
> > > https://lore.kernel.org/lkml/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com/
> > > 
> > > It is based on next-20250919 where above series is already merged
> > > and tested on SA8775p which is now called Lemans IOT platform and
> > > does not addresses DMA problem discussed at [1] which is future
> > > scope of the series.
> > > 
> > 
> > When testing your series on Lemans, what happens with the additional
> > SIDs from the peripherals assigned to the remoteproc ("DMA masters" in
> > your talk)? Are these running in bypass because the previous firmware
> > component (Gunyah?) had allocated SMMU SMRs for these?
> 
> There is no DMA usecase present for Lemans but can exist for other SoC.
> 
> > 
> > It would be worth mentioning this in the cover letter (and perhaps as
> > part of the EL2 overlay patch as well), since it is unclear otherwise
> > why your series does not result in crashes the first time a remoteproc
> > tries to use one of these DMA-capable peripherals.
> 
> As I said above, It is not present for Lemans;
> 

Ok, thanks for clarifying. In other words: The IOMMU SIDs you have
specified in the overlay so far are sufficient for the current firmware
use cases to run successfully on Lemans?

> To handle the DMA use case in generic way, we might require extention
> change in remoteproc or generic iommu framework to handles these
> scenario like its SID and memory resources should be communicated
> through firmware resource table or device tree or some way.
> 
> And same scenario when resource table section not present in firmware
> binary ? like most of the Qualcomm platforms, how these cases would be
> handled and I believe this is similar to the problem video is facing for
> non-pixel case.

It is sort of similar, except in this case Linux doesn't really do
anything itself with the mappings. In the video case, Linux dynamically
maps buffers (or similar) into those address spaces, while in the
remoteproc case those are fixed(?) for a specific firmware binary. At
least if I understood the explanations in your talk correctly.

Anyway, if you don't have these use cases for Lemans this can be
discussed later in the context of a specific example. I thought you have
this requirement for all platforms.

Thanks,
Stephan
