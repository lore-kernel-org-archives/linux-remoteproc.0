Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596641;
	b=1m0k0HNJyv3X/z71j1T1YjwPWblsZre0JIl9uS3aL41PQzvbk06mrOrHkHeX6iQPjqX/
	 pbo3rYvTXbl6HIjsY5D8RzCyuy8rAZ53hBFz0+KHjxgUf+LTikvqv5RKlAQYlVAlQE1uZ
	 CaU/+W97SOe0yPxnCRqHpHTafnehZ2p6h/9OQZmr5d2n7fmhxSdCiCEUwN+IE61qAlxmN
	 snRejiAZ1Kh5KUJlNuEDMW1haJrICVb9g7ivTPascxUDwE4gP+4P0zdHz3g1aloOGlGt+
	 8JgHy2ux9N0ZhazadvloOXXlLR311d5Mb6FIxnDuwSqufkHWaUcEOZhFZvDH4CENjTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
	b=Y0lsnGVfIVRlHhzPVqdm2wV8p5EHjJxfJbxpJOoY1p9C0dbzP37LLx+QI5aYhRraQbgz
	 Oe+q49vm2s5Fi6hpShGNI9HeqpjIKbau9qQAVYtFO5xfgRTuDPopvGltZzcjB0f1EIri7
	 kbXuQc2gTjUL/CrGT1j5cpfo52GNKQ6/J1hus+lWkkV8VT4lS0KWsz6uS85AdNlkwLxaj
	 IjO13EzzwHZm9iueTemJMvRiytsUjOqbD3+U6Bgdc9wZX989EKF4PJYEoix7h3jG51V6w
	 sFivQg9PSHaHnQSZfwBJFbVl4Zfe1e1ubJtRHx/Ji2ybYW2LhaSoPDCMajdq72Bd/Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OBl7H+i6;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69346606A338
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 19:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69346606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=OBl7H+i6
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso27611216d6.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 11:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1794596639; x=1795201439; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=OBl7H+i6ZwCYqyZENMFkOks9QMvP3Q1O5CrDefd7QEnoWxR7Gzg2PWplPwjprGwO9m
         ONLcl2A+SicRV5yCDWOMiHwCcJzaUmNARnD8racf2rem5cydfXkKMyTLGas/HjHQXhp0
         TTMH+rLW9ObkrPLd+QQ+P9H/NwQsFwau/hQwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596639; x=1795201439;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5v4390+5+0gQiMHK1KicuB/Gp64Vkth2gdQzKankJ34=;
        b=frbmBB1fJKvcx5L7lOUPx3GoAif0cmZlA1YRMBLPApNk661GI0TZUFJ1KogbDTg78j
         Ro8FSVXnfVH7cfQuyXpcYLjBugMowr2IJ4KC08j6nnyPs1ZeeYRbHkp0Ds1birvKJVx0
         nADjJhtsGfnzL8KvuozZyQ+iDNRIPyiLn7G3GVxfws9LaJOrZ7Hs6/p4xeDhBtI4m75V
         INvS2Rl7ynYap7LeSVsTrRlpy9OTKMoUe/VzvmAbIfcjgMZOSAFEdF8jyXItgtSdelmZ
         ysPbqOzhbdJxYUlhb7Esg+WjH1hrqcljAvl1s/s0fFXXNGmQinhvR0nkinhZjksQgght
         bjxA==
X-Forwarded-Encrypted: i=1; AL+hErE9EvZ8BdZ01XIYyFWuRCmXM/lSgZidFREcxhd5tladNc6kyIPfdEI6LQw+s5SihyGSQVTGU00Kt557/JrX7T0I@vger.kernel.org
X-Gm-Message-State: APuU4Z9UQsNeiprgeZWfJaLDxEr94NkrA09Ic9Fu5QJUFJalFKaxKK7I
	rhcxisAy6DwUOxOk7ON45IfZGCHyPTG+Wg2i0q1atkAu8Yfbk7FzVGP3NofbAlDACQ==
X-Gm-Gg: AYBFou1b8XRbxCGWz1v3e1hCeJ50vJoJuMpz4k9REL2Ary3rApCVIt02P7gbAUS8sUR
	JhVJgkW05eJmZWnEetmhhrfE0xouaOfRdLozHuF2VYsrXE4Zg4STDia4pxk2QjYvLiAw9Ovve78
	oEclmfXXldwYq/Nnk4Q/FygDLP4APuuzR5czM2X18Unl2OAXDOKIyMvjB8bqzgwR8Otp+pzXQNo
	yc4rEEmY6S1q2I76Ep5ccL/FwpuIp4QLc8rtWni7rFOTnZOIFdoHmlWVYFsr91aSLpW87I+Gs/x
	eT03Wu1+6k0B7Ik9wyAkkYnE2q86evG+yfqXaxrvjw5WBdPLftZ+9f1Xxocwb9Ox7uwZOS4bx9i
	ljaz24FX8J/9xBAbD2gAD2rS1emMTNZqKuP7sJpbYIFxribFyQ2CeUhQeQdwVhb4oN7MnvhEtC0
	nB5oQ3th3MHeYX4ljLLYnYT+YTq1bhjDI9IF4quJO2I/LpHUEVuIMugF5AVyYPTTt2Ny+/R80eb
	465E6IQNUInxgiUkH6kcrnwq+PAC1Cw8sDv4f8uCDYizzP9tQ9J9YZYivdBp1OpVN8w82Xx57KT
	mxnPHVcPjggy9hSVwMnYOIYR
X-Received: by 2002:a05:6214:4409:b0:91c:74ce:a452 with SMTP id 6a1803df08f44-91f241ddd3fmr55479136d6.46.1794596639018;
        Fri, 13 Nov 2026 11:03:59 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91f23d780e8sm27000686d6.27.2026.11.13.11.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:03:56 -0800 (PST)
Message-ID: <1b84bbe8-28b6-4a74-af0c-5b9cfdd8b394@ieee.org>
Date: Fri, 13 Nov 2026 13:03:53 -0600
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] net: ipa: migrate firmware loading to
 qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Alex Elder <elder@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, Alex Elder <elder@riscstar.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
 <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261113185009.157893-7-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:50 PM, Mukesh Ojha wrote:
> ipa_firmware_load() calls qcom_mdt_load(), which bundles metadata
> initialization, memory setup, and segment loading into a single API that
> does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
> TrustZone authentication, which is the intended behaviour. However, a new
> qcom_mdt_pas_load() has recently been introduced that works with a PAS
> context and can handle everything qcom_mdt_load() provides, along with
> additional functionality such as shmbridge creation and retrieving memory
> from the shmbridge buffer when the same remote processor needs to run while
> Linux runs at EL2.
> 
> Replace the open-coded memremap()/qcom_mdt_load()/memunmap() sequence with
> qcom_pas_context_init() and qcom_mdt_pas_load() and
> qcom_pas_auth_and_reset() with qcom_pas_prepare_and_auth_reset().
> 
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

I haven't reviewed the rest of what the PAS library does but
I trust it does the same thing as this did before.  So thanks
again for implementing the non-devm interface.  This looks
good to me.  My ack is already present, but I'll reiterate:

Acked-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/net/ipa/ipa_main.c | 23 ++++++++---------------
>   1 file changed, 8 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
> index 14ac2d2faf7c..0a37741c2285 100644
> --- a/drivers/net/ipa/ipa_main.c
> +++ b/drivers/net/ipa/ipa_main.c
> @@ -585,12 +585,11 @@ static void ipa_deconfig(struct ipa *ipa)
>   
>   static int ipa_firmware_load(struct device *dev)
>   {
> +	struct qcom_pas_context ctx;
>   	const struct firmware *fw;
>   	struct resource res;
>   	phys_addr_t phys;
>   	const char *path;
> -	ssize_t size;
> -	void *virt;
>   	int ret;
>   
>   	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> @@ -615,24 +614,18 @@ static int ipa_firmware_load(struct device *dev)
>   	}
>   
>   	phys = res.start;
> -	size = (size_t)resource_size(&res);
> -	virt = memremap(phys, size, MEMREMAP_WC);
> -	if (!virt) {
> -		dev_err(dev, "unable to remap firmware memory\n");
> -		ret = -ENOMEM;
> -		goto out_release_firmware;
> -	}
> +	qcom_pas_context_init(&ctx, dev, IPA_PAS_ID, phys, resource_size(&res));
>   
> -	ret = qcom_mdt_load(dev, fw, path, IPA_PAS_ID, virt, phys, size, NULL);
> +	ret = qcom_mdt_pas_load(&ctx, fw, path, NULL);
>   	if (ret) {
>   		dev_err(dev, "error %d loading \"%s\"\n", ret, path);
> -	} else {
> -		ret = qcom_pas_auth_and_reset(IPA_PAS_ID);
> -		if (ret)
> -			dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +		goto out_release_firmware;
>   	}
>   
> -	memunmap(virt);
> +	ret = qcom_pas_prepare_and_auth_reset(&ctx);
> +	if (ret)
> +		dev_err(dev, "error %d authenticating \"%s\"\n", ret, path);
> +
>   out_release_firmware:
>   	release_firmware(fw);
>   

