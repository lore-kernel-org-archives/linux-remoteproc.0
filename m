Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C02344D90
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782152873; cv=none; b=aC0kcSL+4n2b4XrbQA7F0bqSNPto2kR0q+6kqt59H/VVtE+LT7aZyo8v9Gf0JFw/+m6Ou25V3GdIWmQIoy/eqv46KE+iknx6P3XizdTnNcrulk0/W70fO/6659URrsI43cjcasbSzaRAXf6v9q8z28GfZdhxrSGeNH8wbsBzx/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782152873; c=relaxed/simple;
	bh=WXpp6VpPk56mF7FkTKrJmxmjij1nAaNciI33Hhr3sUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQBSL9W2FcXsuvXT4mX9zeaVMVu5EHAsQkMFWX5E8lyVfwcUR6BNSRW0mvUHBx6zZsZvwT7hz473itMr1PxfyAvY5Mrw3CJtSuVfe0fkoljcGB8hnGHhUZwZrapbV94lvRLBBm5/xpyWpwP/cputPM4g6rPwmfXpCNbczIM9f1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wko7uuQs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FeQlQhCx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wko7uuQs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FeQlQhCx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MFXPbC1571371
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 18:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L0HkQwtSD2YgagAQb0I/yxF1UB32oN2uPPefh0HxXRs=; b=Wko7uuQs92Pvq1Eb
	V2VzRKKZeD5pHUI4CmM69XlAEUAgR4gXjR5CrchD9eF+aN/93CFnAU1w0yuYx1yr
	J/S7BM8Nxec9NYpc0oCr2Kai0uLIRNN8IG7QfHiA/ErYE6j8bZZbVHcDmaUZl8bO
	uyeB557HuAGvHCzLAdM1HqZZqzC9Iy8Zo6JHcdiX4Mm4LvwGJGExQdY9A1VcqQ/r
	12eH26HCipkQY/KtVJZKlMO33xOQL0XXxYWzDfv6P2Zn7N+OXY4Gnv3k0mQ/umvv
	ISXkBAXnt+suIvmQwVdMixH4v2oMI3iYQlZ+nfrqm0+rKqYigaperLIx21YG517V
	toZZMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey3eb9qx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 18:27:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36bbcd40642so3050124a91.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 11:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782152870; x=1782757670; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L0HkQwtSD2YgagAQb0I/yxF1UB32oN2uPPefh0HxXRs=;
        b=FeQlQhCx28122uNktjTAIb5ieqixC+R6pdr/FLcr0kxY9P6zfWZtyriYW0hBJRMVlR
         HPH0OOrrwJN/MJIrz8rSF3AkX3Fh+/yDveYGVn370IjTbFqosk+obFzwRLUiIMS6AzBD
         o4KcKKu+bKdfPHocP/mxgOIGtUQlkDqc3MLPaFeadPL9gVhBQnPzqzQJWCuFCvuCAZpp
         peIparJnTtKRgORn08b1EKznkc+GDoW5YbsqLGlI7J6AKXHARu+QCqZ2/HV76o6DJQrB
         MQF9OouPndlguLq9Gs6TvQ4a6zjYZop05VTJexeeQPgA0ouNLVTMuLu582vJPxZVVDe/
         Dv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782152870; x=1782757670;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L0HkQwtSD2YgagAQb0I/yxF1UB32oN2uPPefh0HxXRs=;
        b=aa8YRjUrIVKsEiA1uBmkOBARSw0Vm/C/Y+TBFVOyYxqVQtdtiTXjv5k74OrneYu03S
         0qzRFdvfN8KlWJCVEp156sLyWa3pxp55JkaKTOibNqkMAZO9NFgYQ1LGXCBgiEGCiqkQ
         VZno5OLZ1zqymkd7m/PpX0UDuWzr0KqjOEsrKx84tK08DDkaCCLQJ1WRPlVh4kUa5Fxg
         +WLbnmZxgadMBuHSTPt8UCCbPMJ8l253+BhxXrAjZFEZRMgC/vcymY+mg7vOppoRtLht
         aUnPD6LltMzai8JUXIkR0YYrrE6t645VlBarb5ovvjbHAke0BNiPf2Z2yMAVw3pl/qft
         JgyA==
X-Forwarded-Encrypted: i=1; AHgh+RoFXpi+TxwFJAEt3/eYYfiHLoBHqMzESI4F4lP8ho3V5+b+m28LiZewRBkI7C/8oyorqBhBjb6sxatBuyw8wKdb@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGHj0ftt76Of/QzkMMzq8/yZtpG7Mu23dKknzWdJkBxQigRHO
	sM/vwfIOUVXS1xRZzzsOQx6dFDVyzGUPfxOixEisJppbe4fNq7hc202D+lU3odPoLkv7pUXSo3p
	r5CZ+rguFwcewlXwaymNchDXeASpvKmX/4guJyb6RCgv+Ri8AHgRyrUiQ7EOsm2BprIAulptK
X-Gm-Gg: AfdE7cnCKVXFTWWrycLE4uDXhaUb418ggz0CCBh1llzDJxPKFUX14rVEGUiZAuf//jY
	Rf7B3k/mdk9VEYaTyfgP4bpcJrLlkNP32ARFmqB1Yr6sgUqJObILqAUBs/D8aXyRIRDZx3G3P2X
	KHBlPpZL3fmSoBFoQQHSv6asnYs9vnO2txuBAYTz2bB5G/YOUO2wgiVUdugu/lJo7t/0B09SMuw
	a15f9MVplMyoTForvx1pGgMXZHrujdxQ4FizbBh2m8Vwj1vhMdBahOHFVH7OkIm0+xR4Td3DiYI
	ZcE4LM1d0NAnlTAl0EoXPDnKM/aXUPjGsb1jfD4q9IJQ9m2bsqQIjJK0Wu1s6hDjvtMlaXyyj7W
	F3zhtlLDZXA2kzD+LFYVG1I0Fbd0vshNmJqQFKg==
X-Received: by 2002:a17:90b:534c:b0:37c:8e7c:7d57 with SMTP id 98e67ed59e1d1-37d160efb42mr16164577a91.23.1782152869935;
        Mon, 22 Jun 2026 11:27:49 -0700 (PDT)
X-Received: by 2002:a17:90b:534c:b0:37c:8e7c:7d57 with SMTP id 98e67ed59e1d1-37d160efb42mr16164545a91.23.1782152869325;
        Mon, 22 Jun 2026 11:27:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d4eede23esm7751431a91.2.2026.06.22.11.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:27:48 -0700 (PDT)
Date: Mon, 22 Jun 2026 23:57:44 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: XIAO WU <xiaowu.417@qq.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: add SPDX-License-Identifier tag to
 rsc_table.h
Message-ID: <20260622182744.ppw2q44ikydvgo6k@hu-mojha-hyd.qualcomm.com>
References: <20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com>
 <20260611180550.2442641-3-mukesh.ojha@oss.qualcomm.com>
 <tencent_53F3322FDEB2E45D6412C427B8D1C6081407@qq.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <tencent_53F3322FDEB2E45D6412C427B8D1C6081407@qq.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE3OSBTYWx0ZWRfXzvMM1Fvxi2qU
 wvkPBDXabqY4OQB0kejFpFX6cj4ch2QRePTkzByUY+Zie5XtS1xPvOH5nWe3MCC80Hu69Qn1JSy
 ZiTlU6AbOv+fv1PYEk8I6v7OopXyjis=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE3OSBTYWx0ZWRfX9C0IPn5Gd2ip
 AV/++5Fw/rmGM3RLBSzcrnatP9WqfoUZDsAT1ARc6vwaSaBjb+HGBPOMH/0HnKkYORrGxRgXjxr
 Sb6utaWNA2CFrVvFd+7yvqrnp8s7gt4vMX9uzN2tM30Qsrg9Lo+X92LN/bUVstSa7g1u9O+Tmuh
 mlzjwnY2OLY+xQ7/JCMtbj2QEVLGiRJasl889mdJxejxtaG9RHs8/0sR6oH0ajF2L4GF32Q7ll2
 UdwvU5cxfvAyXnUokSPQ+5GfzsWyIkJmgsvqGghPRlndhkDG6sCJgZZF3yyGzZlwL8pDrrvhOcJ
 xlpbJVfDEnWMNq6blT1i80uf++ZCUAwiQldIvnFmT0D4CgdMQBBI/LjyEkv48IUO49fgE0ePHP1
 byfaRyas4bvdsBg620TqPPkxwGLichEMSz1t4bZW4KRboMe1ZNqmsLOpeHzgKYAqyXL0YSMqjcj
 nsUhtMB/CzGbirjmi6A==
X-Authority-Analysis: v=2.4 cv=ILIyzAvG c=1 sm=1 tr=0 ts=6a397ea7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=yQOL5lB6_2nnzVFPXn0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: sdWrUgzblqBF93u4sOayAEgpVaf7Mu1_
X-Proofpoint-ORIG-GUID: sdWrUgzblqBF93u4sOayAEgpVaf7Mu1_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_03,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220179

On Sun, Jun 21, 2026 at 08:57:44AM +0800, XIAO WU wrote:
> i Mukesh,
> 
> I came across a Sashiko AI code review [1] that flagged a pre-existing
> integer signedness bug in `rsc_table_for_each_entry()` in
> include/linux/rsc_table.h.  The `offset` variable is declared as `int`,
> allowing a large unsigned offset value (e.g., 0xFFFFFFF0) to become
> negative, bypass the `avail < 0` truncation check due to size_t
> promotion, and read from before the resource table buffer.
> 
> I was able to reproduce this in QEMU with KASAN by crafting an ELF
> firmware image with a malicious resource table offset.
> 
> On Wed, Jun 11, 2026 at 11:35:50PM +0530, Mukesh Ojha wrote:
> > remoteproc: fix coding style issues in remoteproc.h
> ...
> 
> The bug is in the `rsc_table_for_each_entry()` macro further down in
> rsc_table.h:
> 
> ```c
> for (i = 0; i < table->num; i++) {
>     int offset = table->offset[i];       // signed — attacker-controlled
>     struct fw_rsc_hdr *hdr = (void *)table + offset;
>     int avail = table_sz - offset - sizeof(*hdr);
>     ...
>     if (avail < 0) { ... }              // bypassed via size_t promotion
> ```
> 
> If `table->offset[i]` is 0xFFFFFFF0, `offset` becomes -16 (signed).
> When `avail = table_sz - (-16) - sizeof(*hdr)` is computed, the
> negative `offset` is promoted to a large unsigned size_t, making
> `avail` overflow to a small positive value.  The `avail < 0` check
> passes, and `hdr` points 16 bytes *before* the table buffer.
> 
> [Reproduction]
> 
> I compiled a fake ELF firmware with phnum=1 and a resource table whose
> first offset entry is 0xFFFFFFF0.  Writing "boot" to the remoteproc
> sysfs state file triggers the resource parsing path:
> 
>   state_store → rproc_boot → rproc_fw_boot → rproc_parse_fw
>     → rproc_handle_resources → rsc_table_for_each_entry
> 
> [KASAN report — kernel 7.1.0-rc6+, CONFIG_KASAN=y]
> 
>   ==================================================================
>   BUG: KASAN: slab-out-of-bounds in
> rproc_handle_resources.constprop.0+0x49b/0x510
>   Read of size 4 at addr ffff888031283790 by task poc/9573
> 
>   The buggy address belongs to the object at ffff8880312837a0
>    which belongs to the cache kmalloc-32 of size 32
>   The buggy address is located 16 bytes to the left of
>    allocated 20-byte region [ffff8880312837a0, ffff8880312837b4)
> 
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x116/0x1f0
>    print_report+0xcd/0x630
>    kasan_report+0xe0/0x110
>    rproc_handle_resources.constprop.0+0x49b/0x510
>    rproc_boot+0x.../...
>    state_store+0x.../...
>    dev_attr_store+0x.../...
>    sysfs_kf_write+0x.../...
>    kernfs_fop_write_iter+0x.../...
>    vfs_write+0x.../...
>    ksys_write+0x.../...
>    do_syscall_64+0xcd/0xf80
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> The crash reads 4 bytes (the hdr->type field) from 16 bytes before the
> kmemdup'd resource table buffer.  The value read is 0xCCCCCCCC
> (uninitialized kmalloc poison), confirming the negative offset bypassed
> all bounds checks.
> 
> [1] https://sashiko.dev/#/patchset/20260611180550.2442641-3-mukesh.ojha%40oss.qualcomm.com
>     (Sashiko AI code review — "Out-of-Bounds Access", Severity: Critical)
> 

Let me check and get back on this.., this looks to be existing bug.
Thanks for reporting this.

-Mukesh
> 
> 

-- 
-Mukesh Ojha
