Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEB25258;
	Mon, 16 Sep 2024 22:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726525659; cv=none; b=G4XKW1BCk4tesaMQ0n4fo9giWoJIc/QJ79sq7CzFwMyZKUUrjWncyVO50+5jad7skmDssKYZC2ikEGBQpQBWSGP5IUZ03EWE78qDCVzvIOBLHrxNIPSKuUPdgEhGIbbrh2CAANjhO0UHzcAiDbhCiIn+p+hVSTm96FU+w4k2o5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726525659; c=relaxed/simple;
	bh=nIlagFSn66DD4L/tj9LXtTHlW6lnx6yFHMKMSPiIPZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scDaB2pB+iKnn3At9jSOeLBrJLXJN+jW19cgRwJjAE60uUS8Z2F7rS5CMx2lPWBkSTxYoq51vOH6C3T9RONNVz1O8WxK8gp3MHtsD/9NFDyeje/F5FtSGRatFQ1R4CnuObzB6nKua9upq/JPjukbPI2wdzyBGvguwpMPgnaeENc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP5VPPXK; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP5VPPXK"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d889ba25f7so2607911a91.0;
        Mon, 16 Sep 2024 15:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726525658; x=1727130458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p871//Fs+/qO7+7cwFPvh1c0mSeuK8ASkkcU0dmqUPs=;
        b=WP5VPPXK0lOyfeXPmz0ghYwRKjzRozHHs97BjOsPbDZurbk3Z+YJtLHujwikndS7H0
         ZR84p0+sIsQvYwWuy3tGC4PaZDaohFtF2EBpHrhs6X3ik4NbegRSUAsGAf5m5zLDgdO2
         L7dfSdI1R3Q60NFLg7twnKhPlBs3MbxBDAN8S7h/f5KD2NmRu4bLi3XE4KM3lMBDXa2X
         p3vM9q5n1YMrHiibxLZCrNRDPw1+Ru+0JmguMKwVxLWHC5Z9SaDEIIXGWFbJdQ432W/1
         dVV9htlYL20nGUmnpVwrj14fNf7Gdkaiu2pcTgZ7Mmuob5zM0/kAyFNIsCiSEXWoz8kx
         +BiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726525658; x=1727130458;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p871//Fs+/qO7+7cwFPvh1c0mSeuK8ASkkcU0dmqUPs=;
        b=vwyvZd7tM46b6wd5DeIiP5HkW4jsyfyUisndcf6Xd2u1KHnGk4Ur37bz+J5+Z7Kcpx
         iMpOxDl1iQcOZ5DRSwG2adlEQiC2sqY9E6mECuDYBlCXdaEXFVuAlu7hPQ4v5kNq8mvi
         RQbafaXjei7MTN3KDrLlGv/EgVKVXBkRMWjG4IWPOHZZO0CmmzDhXG5IuoPduUb8ujHC
         L0ZlpIlDvSsrNs6ORRnkb3Aef9HujVvFaP0tAzQWjAcshDLGCQ/OVO+2sOPvv4e41F4J
         kGvOgkJuO3LfXL9qn66i+HXbXvfbdsnxQZ6pacVLJotWP0U7PsQvZW0pqztZQlBy9BYQ
         gNfA==
X-Forwarded-Encrypted: i=1; AJvYcCUU5ok5sApEGJpTrGA2zRgac4B4Mt+ri2CiRa3slweC7MboziHsNoK2h63eHadt8mC+cbM+ZPuzFNOUhAwr@vger.kernel.org, AJvYcCVjB7spUg4QeiYDd87Ug4tJz0Yms76cgZuiAOqbwbc1r4G4o8vJUggiclM3YYhK/OHj5LHdxBO+De2M@vger.kernel.org, AJvYcCVp++vwDrPV4Je7y63u7Awel4hEcCLSjNiTnsq+jDZCYh374JL1HpwDtnmk2PS8d8hWPM3NRbJYoHM47whZuG2c5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yza+v9dfhnGHDDVUqRsjkQuqI3Fo8d3eIB8v+NTdt7HQstx2Rrk
	6c7sE9gPjgVGTXEG1Sw2+JXV/Y6DrqoMs2REn9gi3krH9ChzXMPN
X-Google-Smtp-Source: AGHT+IHOIOa4uoJrvmJHVtqFy1kUCeyLXVe0HcxyEv6ClDTP9rAgSTpgUwY80v38ijtmEJ/ROq/SPg==
X-Received: by 2002:a17:90b:2344:b0:2d8:816a:69c5 with SMTP id 98e67ed59e1d1-2dbb9e1ed42mr16825361a91.23.1726525656975;
        Mon, 16 Sep 2024 15:27:36 -0700 (PDT)
Received: from [0.0.0.0] (ec2-54-193-105-225.us-west-1.compute.amazonaws.com. [54.193.105.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9caafc4sm8017188a91.30.2024.09.16.15.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2024 15:27:36 -0700 (PDT)
Message-ID: <fe87c66d-e5f6-46bd-828a-6fac2b0aa0ac@gmail.com>
Date: Mon, 16 Sep 2024 15:28:00 -0700
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
To: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 peterlin@andestech.com, dminus@andestech.com, conor.dooley@microchip.com,
 conor+dt@kernel.org, ycliang@andestech.com, jassisinghbrar@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Valentina,

On 9/12/24 10:00, Valentina Fernandez wrote:
> Additional details on the Microchip vendor extension and the IPC
> function IDs described in the driver can be found in the following
> documentation:
> 
> https://github.com/linux4microchip/microchip-sbi-ecall-extension
> 
> The IPC remoteproc platform driver allows for starting and stopping
> firmware on the remote cluster(s) and facilitates RPMsg communication.
> The remoteproc attach/detach operations are also supported for use cases
> where the firmware is loaded by the Hart Software Services
> (zero-stage bootloader) before Linux boots.

Would you mind help clarifying the need for SBI_EXT_RPROC_STATE/STOP/...?
If I'm not mistaken, the HW you are targeting is described in
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU64/ProductDocuments/SupportingCollateral/Asymmetric_Multi-Processing_on_PIC64GX_White_Paper.pdf
(typo in the page 4, U51 -> E51)
In SBI, do you put hart1-3 and hart4 into 2 separate domains? If not,
I don't see why you can't just use HSM extension from SBI to kick rproc.
Also, how stable is this microchip-sbi-ecall-extension? Is it subject
to changes down the road? I don't see a probe() like SBI function, so
the kernel kind of assume it can call those microchip extensions without
causing unintended effects. This means those extension FIDs must be
stable and can no longer change once this code is in. Perhaps checking-in
the microchip SBI extensions to major SBI implementations such as openSBI
first would be better?

Bo
