Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC7739DBEF
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801889; cv=none; b=M4Jm9xEgvCFn6Si1xvD/bPbEcXsclBC4lCh11cHq4apTuETRQBxJpPUj+PX9nWRkrB6E8pjnxjkMmfyRaPStrscQa10QclQP3CoAwQWgILTAL1S1JEXFx688UiZXc2IOQCcw9RXkw93zjpioDkFa1nckMTq7l7GTNWCEz8ppnU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801889; c=relaxed/simple;
	bh=ZPG1/RS8O+KvzCdks/Ndzj5X8q7C5WT70EQKLdblerQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwDT5NlEnOoYVSXjRdyBKjOus4OmniI5klGw2zYm54JAbUDU89MQCw9TAn1TbIysRwfvAofoVmQEArORj5yS4D32CcNGrxqTF1WzQJdYwgSyHeJZMeiDTmUQ6SYRwfOXDfdSlNPgR2g2eIR9PyCgOCbFUPvI8W3uQ26EsK6DM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LHePYIZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh5JwWdG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LHePYIZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh5JwWdG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CJf31029980
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 06:44:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3SLxg4qCkZ7FgDyKyk4vVwX16KJFlPAb+bsnxdA3m4=; b=LHePYIZNJmIKtmk0
	rOMnaymAf2UrNhOtjqH6bepvJJxJOeDSyWRITADtPrQPWUj4b7hrG3YGarJhV5Yp
	zXgLcGOKL8XA/ucQCxFzhqa1vCL8VBMyfa2WBqNHdbTrQ7R4wfHDh3Wuye9zolNP
	OZkEruGG/tH84iV32EzQXKGl1W/koA16wMtAKkmW8d5RPzeSxE98/JeilnuASNQO
	nLP+f/Y1OmjJ45eJfv2y7RNJjVRU+vr3VqK4FcHHO6M/9k0e+TjEwZ23IAgf0oY3
	Scub3YfV6AqeJCnsUhwwuYrr3Jbyb5OaeedGzAXF/ZMLytpMt+wrDXxXuXSmxYWl
	dlSgpw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44v4guq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 30 Jun 2026 06:44:46 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c95b0e22aso252466eec.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jun 2026 23:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782801886; x=1783406686; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3SLxg4qCkZ7FgDyKyk4vVwX16KJFlPAb+bsnxdA3m4=;
        b=Dh5JwWdGphgO+8M0viD41B2jIc9lqVlWlve2cvCwXIJ0HQIfFfEUxVddJQuOKH8pJ1
         AoeZGKLOD0SNqCe2qCTTjnMjkzOJLv7RBkVIgQYrQRU6Yr+OxhsKSNvSJ6T4hC4CIJq/
         2rJIhrH/KtqTu3P7QD55VgoX98dgbkWOdsUTzKg+cUXv/CbZM1iW5HqKfhmtMzxqaKXt
         egx2P4iGvogJXEbuon0bNdkNIOzKY6ifHxheuKi+6SqQZwoJ43XAkov/miI49K3pXD8C
         Q5T9uw01P8Qb2X1saaiRxsdEsBW6QmS7k17kZsAYt8Aw2rOb5lK61olVoiqs7cv1U+Ef
         /rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801886; x=1783406686;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3SLxg4qCkZ7FgDyKyk4vVwX16KJFlPAb+bsnxdA3m4=;
        b=ARXRWXlNVYx+xxsX1qndZ4qNgu3Ch1m/pNn9otEMVRNeepf3Nf5F0PPPWdTCEgIh/X
         AUf+SvwOFQWGv6WQmHUoulRGgN+D7/l2h8tkZ33R27Pey5p2Ys6TGI8e+JKyr0pXnlbK
         RjpAjpY3VhOu3m4GS0jDEqgsuTXaIDRTd98h5MkeBWfijkn74/BH5z4aALN63KQHtQn3
         kPljCGEcow5p13N/b0iKgFJpUaWapoaXysMOnJcBvqZWgQaL9r4YLZ2QzDMcrSsF5nLi
         1Eaa8cVs37s0y9mc69XMxaMzgca8MY/jZewrUnYLYNEqX8SrBDk5a4qupkJff86qcVUF
         bpEg==
X-Forwarded-Encrypted: i=1; AHgh+RpsnPSaaEZF0db9cg7ujvKvGru9jzDvS+q3ZxDKLpPyam05DatAmc2TvGW7QXgXch0Bf/mW7022VE0L+8fFmG6A@vger.kernel.org
X-Gm-Message-State: AOJu0YxzY3qAiL3KDkgkNM1HtiOX5G6Uhy5gbQeMT3v9ILXhuLTBJAyu
	FxYCQYCLtBX+xPcxMmWiClqu7HY9o6W2o/8UQqsL0jx+GZ8Lt8r1acg8pADHVHwtWFpUaoxTA5F
	S4Nnau4GBv14sihskGxycGi6JJi9f+o2WH8TZZePCKVwQNxGl4nz0pkiR6lBJTUhXA2rj2JO0
X-Gm-Gg: AfdE7ckyG6zjqU214NvSYikw8o651Bx9ZNXZYdBUqSA9gVH6ls9vGrpH8FcJzCZD9AT
	aFg4irKnq64O6H4Ze2pE3Wny2lV0g2fJccs+K5qoab7LhVwpyW+XWoAyUISrCQNgKscNUA/uZZn
	iE5VNDoQ2NZExk9ySBh3V60XVrgxyksGqPQiQNXmbyDECku3p3jjjKwRTnhUF2uPebMDurWZ18n
	cJU/jtCgGrUZzHVRXMKWOL+hiaqtw+5rnYRNTFU4s5HYRJ+ESXvHk043GlN13OdY5hElTev5GaT
	bAEJO+gf3/zbWxXKFojNEXjLI2QYgkp6o6o8vE1O1SwpidHmu/9WGOAvugFZq2V5qyT+HmaD4JR
	KA2+VmtETPRt9j7dWaX+ppCcc3Xjo+s5yYzsFcQ==
X-Received: by 2002:a05:7301:2c8b:b0:30c:ab4f:46c4 with SMTP id 5a478bee46e88-30ee140b3damr1728726eec.42.1782801886041;
        Mon, 29 Jun 2026 23:44:46 -0700 (PDT)
X-Received: by 2002:a05:7301:2c8b:b0:30c:ab4f:46c4 with SMTP id 5a478bee46e88-30ee140b3damr1728696eec.42.1782801885198;
        Mon, 29 Jun 2026 23:44:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2ffdbfesm4546652eec.11.2026.06.29.23.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:44:44 -0700 (PDT)
Date: Tue, 30 Jun 2026 12:14:39 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: XIAO WU <xiaowu.417@qq.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] remoteproc: add SPDX-License-Identifier tag to
 rsc_table.h
Message-ID: <20260630064439.76luryy3ckeendif@hu-mojha-hyd.qualcomm.com>
References: <20260611180550.2442641-1-mukesh.ojha@oss.qualcomm.com>
 <20260611180550.2442641-3-mukesh.ojha@oss.qualcomm.com>
 <tencent_53F3322FDEB2E45D6412C427B8D1C6081407@qq.com>
 <20260622182744.ppw2q44ikydvgo6k@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260622182744.ppw2q44ikydvgo6k@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-GUID: D3HpzGLP0CvQnVktNXQ4wFM7eqIXgAsT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1NiBTYWx0ZWRfX3Sm2xTbhfn5N
 XqOHP2KQNu1Ck6NEPkomrCWl/5fKK22A3r44IDms1BXfxeMJ3MaDxGjyoOKPw1NZAXgQcP7KykZ
 hT2eP3okspw5OU4DA2YwGGBvPlAEAyo=
X-Authority-Analysis: v=2.4 cv=JI0LdcKb c=1 sm=1 tr=0 ts=6a4365de cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=1gOgIdS7evJ60He_eB4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: D3HpzGLP0CvQnVktNXQ4wFM7eqIXgAsT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1NiBTYWx0ZWRfXz2qQ3pnuJMQ5
 PXzVrgR6PpVV2zNKw0ISPKf3zwgthbxRbEHoYQl8zeYfvsK2E2PrhLqOiYJFFYbyL/cB6cGkv7E
 RwEB22ICaF7BoahaGZ+X6YFRazAw+dbxPYx14ZKHQXsIFJJ/AOwKK8iGB1uUF2fkgUHD39MALzQ
 8LxgQVYmpg5hC0KdruPFb/z7pkAw5VOb8Ir7hnZ3etEVyB6FKmWap/CeQw3pLLohe0B/qiAWqD7
 5o4ajEZkLkhZv0w5Klg/UJkvOxsGDzhoyUVEht8tyItaC8Z0ffGHZNH1fsDOeitm7JUwa7EJRXL
 yOYOMLn7emmyMGVHw4mo7Iga/gu4B24/3e0vW9jxUfiqq11dBtsBt1v633k4zkXHTB0+4cf+c/5
 6mxgWupdGD5CSpqKrGaRUROXhPLxW8thbuYQsHkofHoC+G8byoUDEjekhhZmZxewo0apJ6q8gFc
 RDKzkwspq0qwiNgzzWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300056

On Mon, Jun 22, 2026 at 11:57:44PM +0530, Mukesh Ojha wrote:
> On Sun, Jun 21, 2026 at 08:57:44AM +0800, XIAO WU wrote:
> > i Mukesh,
> > 
> > I came across a Sashiko AI code review [1] that flagged a pre-existing
> > integer signedness bug in `rsc_table_for_each_entry()` in
> > include/linux/rsc_table.h.  The `offset` variable is declared as `int`,
> > allowing a large unsigned offset value (e.g., 0xFFFFFFF0) to become
> > negative, bypass the `avail < 0` truncation check due to size_t
> > promotion, and read from before the resource table buffer.
> > 
> > I was able to reproduce this in QEMU with KASAN by crafting an ELF
> > firmware image with a malicious resource table offset.
> > 
> > On Wed, Jun 11, 2026 at 11:35:50PM +0530, Mukesh Ojha wrote:
> > > remoteproc: fix coding style issues in remoteproc.h
> > ...
> > 
> > The bug is in the `rsc_table_for_each_entry()` macro further down in
> > rsc_table.h:
> > 
> > ```c
> > for (i = 0; i < table->num; i++) {
> >     int offset = table->offset[i];       // signed — attacker-controlled
> >     struct fw_rsc_hdr *hdr = (void *)table + offset;
> >     int avail = table_sz - offset - sizeof(*hdr);
> >     ...
> >     if (avail < 0) { ... }              // bypassed via size_t promotion
> > ```
> > 
> > If `table->offset[i]` is 0xFFFFFFF0, `offset` becomes -16 (signed).
> > When `avail = table_sz - (-16) - sizeof(*hdr)` is computed, the
> > negative `offset` is promoted to a large unsigned size_t, making
> > `avail` overflow to a small positive value.  The `avail < 0` check
> > passes, and `hdr` points 16 bytes *before* the table buffer.
> > 
> > [Reproduction]
> > 
> > I compiled a fake ELF firmware with phnum=1 and a resource table whose
> > first offset entry is 0xFFFFFFF0.  Writing "boot" to the remoteproc
> > sysfs state file triggers the resource parsing path:
> > 
> >   state_store → rproc_boot → rproc_fw_boot → rproc_parse_fw
> >     → rproc_handle_resources → rsc_table_for_each_entry
> > 
> > [KASAN report — kernel 7.1.0-rc6+, CONFIG_KASAN=y]
> > 
> >   ==================================================================
> >   BUG: KASAN: slab-out-of-bounds in
> > rproc_handle_resources.constprop.0+0x49b/0x510
> >   Read of size 4 at addr ffff888031283790 by task poc/9573
> > 
> >   The buggy address belongs to the object at ffff8880312837a0
> >    which belongs to the cache kmalloc-32 of size 32
> >   The buggy address is located 16 bytes to the left of
> >    allocated 20-byte region [ffff8880312837a0, ffff8880312837b4)
> > 
> >   Call Trace:
> >    <TASK>
> >    dump_stack_lvl+0x116/0x1f0
> >    print_report+0xcd/0x630
> >    kasan_report+0xe0/0x110
> >    rproc_handle_resources.constprop.0+0x49b/0x510
> >    rproc_boot+0x.../...
> >    state_store+0x.../...
> >    dev_attr_store+0x.../...
> >    sysfs_kf_write+0x.../...
> >    kernfs_fop_write_iter+0x.../...
> >    vfs_write+0x.../...
> >    ksys_write+0x.../...
> >    do_syscall_64+0xcd/0xf80
> >    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > 
> > The crash reads 4 bytes (the hdr->type field) from 16 bytes before the
> > kmemdup'd resource table buffer.  The value read is 0xCCCCCCCC
> > (uninitialized kmalloc poison), confirming the negative offset bypassed
> > all bounds checks.
> > 
> > [1] https://sashiko.dev/#/patchset/20260611180550.2442641-3-mukesh.ojha%40oss.qualcomm.com
> >     (Sashiko AI code review — "Out-of-Bounds Access", Severity: Critical)
> > 
> 
> Let me check and get back on this.., this looks to be existing bug.
> Thanks for reporting this.

This should fix this existing issue

https://lore.kernel.org/lkml/20260629165033.1144530-1-mukesh.ojha@oss.qualcomm.com/


> 
> -Mukesh
> > 
> > 
> 
> -- 
> -Mukesh Ojha

-- 
-Mukesh Ojha
