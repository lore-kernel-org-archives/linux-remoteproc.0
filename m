Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93DB351C04
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481068; cv=none; b=VH5H+bNif6y5+hU+J5czRoKsquwSWz2yapnL+94hrQsXTvWcPQihgpvMCd2CkXHEIm5AtjYiRvdhk2wKgzTQrwyfoDDXAaznILJj40QkIuD3XO8PrSANltuigRYzu77pUslMsVExWWGynjtqKJquRaz2gXTTJA4M07/8OXdvOAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481068; c=relaxed/simple;
	bh=4X0qE/+9EobLoj7t9ZV5NPVCQRMDrDTS6U+ANhwEI9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AEiBHcKl92yI8DpUbu7kKeA+WpLcCk0x60xDEi/ylirgXKtxJyG/vkyYVmxbgiJw7Ks4wkF9VoOThoJm9JvNXsP56cV5xV4krs8YHxbBeGY5JNo4DlHHAYQZczlS0EtxOCXhRP8QsdKWx9ps/ow2faqObmQzwpBdxF7FQxuRF0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6LWjhQk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcqGoUzW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6LWjhQk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcqGoUzW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V67YGF3011073
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RW2EpvqwX1vlL0MuccoDS45n
	AqMv7kF87jFgmJz7eFo=; b=o6LWjhQkZmZe/Nl6BjDgfotR8kSvo/aZKdgSksPC
	a4qLGp6ZajDyCzcPebe05kOaun2vaKLzsNfEgMDXlUL1D+1JKqKkxQCcgepLVjay
	J1a/sMNuy4r0e72hh8vPv48d3W7ETAwfT++j/7sugXKRfsGdfej+Xj3z5ErIcmWi
	COU/18RD9ZN3H4NN+6JOoudY54ABg3qi0aqgNm1dhcACEpQ8q6/R1x+yJ3m+0oji
	izHOEJ4OhR1raWMdo50wEPpgjlH4LHtvJSEjMULwJt9NBlpedd6UqgmOI0njXY+1
	Rr89oFTBe6VSM5HYk8kdeGvyW+JFCD2ZfBeH+U3zhgsIkA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp5n86pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 31 Jul 2026 06:57:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so12349331cf.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 30 Jul 2026 23:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785481065; x=1786085865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RW2EpvqwX1vlL0MuccoDS45nAqMv7kF87jFgmJz7eFo=;
        b=XcqGoUzW92/uLTojSueKOsFHL9pTBbz931ckuJRYSrvRr9izHkfcg3V8CDaZLDtuUQ
         oVwgbMk1F08rtWMVFKJ2fYJLl+LdMgKj4fUeZ7xZXTv04lEVCC5wYVd6ksrm1aeLTG9r
         TjxlfL4nyaiyY0g5zg0nAuA+SJEJx91umShTnePuQyaUA4sn2PS2uNUvyARvRtOBYcoj
         Cmd+tb5yjTf+EtDAp2fXr24eUmof6nP4uuCPLVt/kywdplHG9zOlHF6nLMeScsoVO1nr
         XSo44V1qen3tZkgran+I9Lo7AnA58EK5BpfZ/5+APr4nn3oC3J8yMe5NX8xYyRGrmbWx
         U1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785481065; x=1786085865;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RW2EpvqwX1vlL0MuccoDS45nAqMv7kF87jFgmJz7eFo=;
        b=XDtr5WzGsftbjnWzNpxXhtdzYJ7oqVw62ev10T9fsiOPOLLXLsxtL2z+VFzEYPl7nE
         J8C+ijy33AHLEmbm8mMUV7KxJ+WFYiBxx7sZJZKkTgURCi2LHm0VYU3L6Y4s5y/xna/T
         yE1JpUBCj5ZDAy8N/jYiXnfxU5beVuRsXsdu4MXsmvKzlChO4XROCx2BkV9/krtwSH5U
         eXkS3hqunoBrir/oU5qc6LF94YEEdm0LLa9LQgR3FtbBtOARL/LWTtVa9N3bwT3o1XdP
         dotWbfJhwOFKn3gReB22ior3gulFLoxPm3n+OQKENENhYw5RpTyIVpyqG9Y4YEfJuaIp
         sZVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoOC4Fo5oowLgvlMG0AvxpD+fCRucz9TrnK49rItYIIqqfKjqKbEGo5KhHJK6pdukApPo6ccRGbiAeDXi7LJefd@vger.kernel.org
X-Gm-Message-State: AOJu0YyFyKKTiKIlIC1SL9iGvS5Ef5CApts9lLyuVu2SjcLYsL0ryKVp
	4M+VMQ3pPdNHlLug5zy/amkTyyXw1soeYpaQGBi4oONPduIa8P3aJJ60/DLhOoKszXmk69s708d
	T2OFAJk1ctwe2To9Kgmq2t821qZS/Wc2yl718tyNnJ0AXS4nPCsU7ZwWYU1iubrh8/PovaXmP
X-Gm-Gg: AR+sD11bZ0b+sgDkccW0ulpzWypLYZYnkL1pC0/9DvFORnuNOQhCgHf83QwbtpB5yYe
	VDnaLlbIoj3MqyfE8zWAaP6eHQ+Z3qC7Lb0IqAKdZzhc2/M1J2KJ12GUrppbJ5hfnXri+ESs5Zn
	RONl33Nc82/3lHkNU0fIvl9bX43qAXmeinh1EsAGHNU6yEShQEwlCl+WAZiI20/nP0fdj8Ze6NJ
	X4fgejECUVednTt77p3Mhy9uFM64JwvWughVnHQMC4pr5ymNMCdzP95gOgKOGsBk5zEwcYiHKtn
	Wg063TUmi3Gf478IPGxGx1XE7I2UhFeAoCP7Oh4bgLcNerGRJCWtUhUrpLuHDc3GKwa2bzwtUMr
	Md446s4vg2wiOzkE=
X-Received: by 2002:a05:622a:1aa0:b0:51c:19af:6330 with SMTP id d75a77b69052e-52b4b001ac3mr9750141cf.36.1785481064842;
        Thu, 30 Jul 2026 23:57:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa0:b0:51c:19af:6330 with SMTP id d75a77b69052e-52b4b001ac3mr9749791cf.36.1785481064373;
        Thu, 30 Jul 2026 23:57:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458ea4asm1206691f8f.31.2026.07.30.23.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 23:57:43 -0700 (PDT)
Date: Fri, 31 Jul 2026 09:57:41 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom: q6v5_pas: Fix unbalanced handover
 IRQ enable on attach
Message-ID: <x2wm2xdearpzyuvu533big3sv4iiwl6oayjwiospivuikygcny@ftdamvzu73ky>
References: <20260731025655.2642860-1-shengchao.guo@oss.qualcomm.com>
 <20260731025655.2642860-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731025655.2642860-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: 5rB-LPnh102shnb8O6teYeVumNc7h9kq
X-Proofpoint-ORIG-GUID: 5rB-LPnh102shnb8O6teYeVumNc7h9kq
X-Authority-Analysis: v=2.4 cv=bKwm5v+Z c=1 sm=1 tr=0 ts=6a6c4769 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=CQgz1JFcaKPrw9c0m9QA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfX1VqHucWVhMXg
 y/O+nwD0jD0qKhMoSqJQTeyfruafYV0WJLqAbVcTY+6/sMeCMYAl73S/bHdFCg53zo52EnpB+lf
 5DCNK8MSW9HZ4nC0R1Z42MJqifT5LP4VLR/vL/4tSLQhjO9hWhZPFZkV7+gCXazxmRdh8rvRgGZ
 VVAfIw/L6JOO40c5hma7q5QbH93oYJ9Filvc5kcpmt3aLiwUJBuBFEDqWtJEEogxXbNhL+NeOYe
 jmx7O2DZUVKYoBDVezLDcjiWu0zAJ6YSnBe673c+rWPowG/He+pzgO/IIK9NZPgLqk3sDXc/kRt
 OVx8gPshqzZSdBybcRjidx3c4BKwYcBKv8WuRpbFcrYjwvQcrNmSh/xUN33hlyaumg6wSkR22fx
 OHnY85rLt2cOkObLY2O2SB8y6PJSZ1+9Egtg3LpQwm4fPJFJmvIkOz28vhCyo8FdoGqBHSgRb/L
 8FBdYx08qAnzVwrIFhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NyBTYWx0ZWRfX8nGJK48iSIvX
 gkkqBAC8goksKq0MnaxgAPsOVGQJCCsPIiwblxlGLDj+dVRyWZ90ShQZGyFHCQdp7RSTGHtBq1v
 hABDv1hORdVIPpM1ORhXJmwdkVzRt5U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310047

On 26-07-31 10:56:53, Shawn Guo wrote:
> commit bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ
> one-shot") introduced tracked, idempotent enable/disable helpers for
> the handover IRQ, gated on a new q6v5->handover_irq_enabled flag. It
> converted qcom_q6v5_prepare()/unprepare() and the handover ISR to use
> these helpers, but missed qcom_pas_attach(), which still toggles the
> IRQ directly via enable_irq()/disable_irq() without updating the
> tracked state.
> 
> This desyncs the real IRQ enable depth from handover_irq_enabled for
> any remoteproc that boots up already attached (e.g. ADSP started by
> the bootloader). qcom_pas_attach()'s raw enable_irq() leaves the IRQ
> enabled while handover_irq_enabled stays false, so a subsequent
> stop's qcom_q6v5_unprepare() sees the flag as false and skips
> disabling the IRQ. The next start's qcom_q6v5_prepare() then calls
> enable_irq() on an IRQ that was never disabled, producing:
> 
>   WARNING: Unbalanced enable for IRQ ...
> 
> Additionally, any handover interrupt latched by hardware before probe
> and delivered once qcom_pas_attach() unmasks it is no longer
> suppressed (the ISR's early-return-if-already-issued guard was
> replaced by irq disable-after-first-fire), so it runs the handover
> callback and disables proxy power-domains/clocks that attach() never
> enabled, causing genpd runtime PM usage-count underflow warnings.
> 
> Route qcom_pas_attach()'s IRQ handling through the same
> qcom_q6v5_handover_irq_enable()/qcom_q6v5_handover_irq_disable()
> helpers (now exported) used elsewhere, keeping handover_irq_enabled
> in sync with the real IRQ state.
> 
> Fixes: bb7c5d6f5b41 ("remoteproc: qcom: q6v5: Make handover IRQ one-shot")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Thanks for fixing this. I should've caught this on Glymur.

The fix looks sane to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
