Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD3D3C3787
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jul 2026 18:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783536444; cv=none; b=SzV7u2qQqUtLpV20e9hJvR5SqNhFMBj0zWMdvGx4YcNWJtAbo2g6g6kUMtnkSdCikTi6lRmrMShGjiYqZotlqGgNjJVfJaIaKr6x9rcU4P9RcrhJQdOgqGFYJ+SG3kh2Doka2tsxQ3sbiMTKCDZE78OdIhDxMFJPvZhIiYBoHx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783536444; c=relaxed/simple;
	bh=mACmuHlZX20bUZH9GBr/hdZ+rwWW1JFJPM3em3vuYQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSWXfYvBQwnyi6XrZHGtuMZLiiGnlYp00FRsdj+PJ0xu+noLHmD+j2EXoeiaYCC6dnCnD+yCJSEqjC7nQKSHZQPijBFMMlLq6L98hgr9nILdePCR40/tH2FVt/w5WwEoJ7i7EXUctXJEMGOkFH1KRWTfCww0mpd8vzW0Bhs2ZhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SMaNwRkG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYrnNONW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SMaNwRkG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYrnNONW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668GLPw53256926
	for <linux-remoteproc@vger.kernel.org>; Wed, 8 Jul 2026 18:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aigJJJhGHgfhaydfVTP5L418
	kGbReJJsoG+/PNyDn6Y=; b=SMaNwRkGGiXFqk3zH2CodUO4ECSjUVFVC/X4FqB1
	j5mLgVbPxoKgorsdxTeZrKaZzGO+m1dKDRYMrOlFTHiEzsHwchmsU7KJFV/je2gk
	Ty9GtRcXbiFk4cowSfqau0ulYADsAZEowTGMSVH4Dw8FbeVrXwezYRlFFkjDDWMi
	tE8d1zFF5BDOEkWaiYDc/L30ikNG3OkTEpcNcZf4TTGMAfTQqioDnhoDfWa7Wb2z
	zev2S/gX7OCu8y67llRcm4+TfgFMAHCO6CGwRJZspTQF2kZWaGUaxJFuW8TTuE9d
	kaxk4wubm7eRKIZvdZ3a0FwF1fuHlHUdPTujqnh/RUzJgQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqw8nts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 18:47:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c891ed872ddso1608393a12.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jul 2026 11:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783536440; x=1784141240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aigJJJhGHgfhaydfVTP5L418kGbReJJsoG+/PNyDn6Y=;
        b=EYrnNONWGjctW2ydPq5YUXQLZePfCmuEEUkBWhISE5NZLkFLnzJr2J11MsBVUHejwC
         Xv9XzGJeWLpxugWeIrrFmsyeXVav26lOPx+Pp8XpIvh6b1tBBNCy8hFXBoy/mMPFvDIH
         kQQ85TMbAILj/S+ztAP5fJFeVILx8sRkMHP0EIFra3CD0YAMbnD6GTPPYL0KV67hSW/0
         ahzJogci0FF5gV3jc95h2zrQU5W7nV6D5sE4pWaxAsz32+BpIgSAOw56VEZV69QkUd8Y
         hcuaoMjDigvPn3xNtl87d59hWF8MotH30ZqjfPZ4bZRfTtZEf2km4cYzu2Z++mml/oA/
         ZvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783536440; x=1784141240;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aigJJJhGHgfhaydfVTP5L418kGbReJJsoG+/PNyDn6Y=;
        b=AmjpD3iYEOOkomLPK4UQkA4ot9LHtiAfOUGg4O7PHatMOKajtu2x9HCrKlPc0cFbEB
         I5AkWwOcAnz/g87JeDFRc1oZm+WkmNct7JA9WvoBhBem4u7pbVE71bWsZAzMUtX8SU5S
         34YfPALxYLpVdbwXHA+ut+xjgoCNt3bLHDBdKYIfi1wWXecUUIx1MtIrBB0+/e3wlOMu
         RBoaKI9FQtHtk2Zf9DkdZvcxzVtN2uJQpzF68rF39kwQyHXzx7FhO0Pl1ON2yBXJz1mu
         Bn5TMLs1R7QiygB0B6NIn+ogAsMQaZk96CmYAaq0sQpMxO6b2bL3p5fbof/dw+czXWpF
         d0Qg==
X-Forwarded-Encrypted: i=1; AHgh+RqvvlDz2iDfFgVG/2U1AubowpDXXhUDMzh0SXF7PQsFuV93FKPG74BQrbZpgsCziurVKR3Hpk7URXkJ6pVE02vl@vger.kernel.org
X-Gm-Message-State: AOJu0YwCE6eZdpxp/1HtXTIoVAXsb6BGeNN4LDfgu4YYwY4lgjXueILW
	fh4yjmr69yJaWqC07hEMIf9Q0Sku4Lu+Pax5IPUKbHQwSsx1XNQQf2irzzw3KpKGjTtM8b7l6r0
	/oDIPE/kNXWuubr4VcyutBsgnyfd3EKJWgbRVnfgkJ15T0TPAW7/7hJp8LT0AaiHk3mtLKyV9
X-Gm-Gg: AfdE7cm1PAfB39mIbJIyP7bTixXCLP0RN81eZmnS41trgYj77wezPO8bOLU2xGT20KL
	eUMZCsLuheCJWpvFCe4jzwLknlfDogbY4rGII7BYER2fFRvyiwOy5wU7MBXOX+evq4iu9/JzoYd
	mbD1Hxdif7YQDunKZqkH2U1PgoJXe6CtJHjDPbcf407hVbM26ahBPgG5hPT3C7+dQpzX6xhFATM
	1Dj0RIZ0hOpJbD5KUFNSoKP6qX3LQvDVtkgMJffBc8UjIANYn5WQ1JYXKMJ1t/A0gaT4YtkfNZO
	y+Y9u6nzE0Li/UQbXBVnaUXfDuSnG9NeF5iboWr8L/vhCv7yio5qIvymJIk3S6fKWNuxdqS1Q8S
	Uj2P/a/PwuoRgi0Dl8k+Vrukyh1u9+Z+W8M8fGw==
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:9e25:1a17 with SMTP id adf61e73a8af0-3c0bc8c2038mr4677425637.12.1783536440184;
        Wed, 08 Jul 2026 11:47:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a9b:b0:3bf:9e25:1a17 with SMTP id adf61e73a8af0-3c0bc8c2038mr4677313637.12.1783536439597;
        Wed, 08 Jul 2026 11:47:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6594f9a0sm23425858c88.4.2026.07.08.11.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 11:47:19 -0700 (PDT)
Date: Thu, 9 Jul 2026 00:16:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: akpm@linux-foundation.org, anna-maria@linutronix.de, arnd@arndb.de,
        andersson@kernel.org, chrisl@kernel.org, cl@gentwo.org,
        conor+dt@kernel.org, david@kernel.org, dennis@kernel.org,
        devicetree@vger.kernel.org, ehristev@kernel.org, frederic@kernel.org,
        mingo@redhat.com, jstultz@google.com, corbet@lwn.net,
        juri.lelli@redhat.com, kasong@tencent.com, kees@kernel.org,
        konradybcio@kernel.org, krzk+dt@kernel.org, linux-arch@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-remoteproc@vger.kernel.org, mathieu.poirier@linaro.org,
        peterz@infradead.org, pmladek@suse.com, robh@kernel.org,
        saravanak@kernel.org, tj@kernel.org, tglx@kernel.org,
        vincent.guittot@linaro.org, workflows@vger.kernel.org,
        atomlin@atomlin.com, ast@kernel.org, aliceryhl@google.com,
        linux.amoon@gmail.com, ardb@kernel.org, baoquan.he@linux.dev,
        baohua@kernel.org, bsegall@google.com, jackmanb@google.com,
        leitao@debian.org, brauner@kernel.org, coxu@redhat.com,
        dietmar.eggemann@arm.com, dianders@chromium.org, ebiggers@kernel.org,
        feng.tang@linux.alibaba.com, yangfeng@kylinos.cn, gary@garyguo.net,
        guohanjun@huawei.com, jack@suse.cz, wangjinchao600@gmail.com,
        joel.granados@kernel.org, hannes@cmpxchg.org,
        john.ogness@linutronix.de, jpoimboe@kernel.org,
        shikemeng@huaweicloud.com, kas@kernel.org, kprateek.nayak@amd.com,
        liam@infradead.org, elver@google.com, mgorman@suse.de, mhocko@suse.com,
        ojeda@kernel.org, rppt@kernel.org, namcao@linutronix.de,
        nathan@kernel.org, nphamcs@gmail.com, n.schier@fritz.com,
        pasha.tatashin@soleen.com, petr.pavlu@suse.com,
        pnina.feder@mobileye.com, rdunlap@infradead.org,
        rioo.tsukatsukii@gmail.com, senozhatsky@chromium.org,
        skhan@linuxfoundation.org, sboyd@kernel.org, rostedt@goodmis.org,
        surenb@google.com, thomas.weissschuh@linutronix.de,
        vschneid@redhat.com, vbabka@kernel.org, youngjun.park@lge.com,
        zhengyejian@huaweicloud.com, ziy@nvidia.com,
        Eugen Hristev <eugen.hristev@linaro.org>
Subject: Re: [PATCH v3 26/26] meminspect: Add debug kinfo compatible driver
Message-ID: <20260708184652.tjbqhvmoqrou3ncc@hu-mojha-hyd.qualcomm.com>
References: <20260708-meminspect-v3-v3-0-7aa5a0a74d5c@oss.qualcomm.com>
 <20260708070809.2660886-1-mukesh.ojha@oss.qualcomm.com>
 <ak4DqBta0boElPak@lucifer>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak4DqBta0boElPak@lucifer>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE4MyBTYWx0ZWRfX1CfkVjT+GPVU
 e3MTjmylv2pD6UD8F6O5XYgOxrWtBvDZxfaACAbuP/QRAre4cDaxuAk20S0EkoVvSKUI1DcVv77
 vwtFFw6OB67hYqWOnsaUCQiTF5dLuCBkjV+3Ke8TxAUbkBArBnQITVnBbCjGA8ZPl8Ic/Z2d75w
 aeCXyysip/TOa7GGIzIfuom3X1kJf9uHAt3ll5F+2R06h23NjP5Q6X99Pd+zEAn4odUGTB4/bly
 Ji3ft3JUdPe64IB6F3CIFVPMRtiU0qgeiu74YvZrF18FNBjmbs6mRla0cexaDkjo9yrVVcQagVX
 fwwcDJf3Cd1SE+4hYep0M8XHLAlIyxyPPDcU/HmQXWmTBaatoAQK/NCOHQFQnp8XHp0k0pHawjj
 2KqRse/0yFItlE0yWT2oJAKc/5/uUqBhu7fdunuVUNLPCW9PtVdTjSp+EXtzpWLNFdn9QCea4qG
 3zZO3nGOU2+bNzd7flQ==
X-Proofpoint-GUID: UGYxABevyeWtMnv0daxGJNVJ3COADCNK
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4e9b39 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Oh2cFVv5AAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=Tty9oNO6AAAA:8 a=1XWaLZrsAAAA:8 a=908p1EQr1GbHt3uppzYA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=7KeoIwV6GZqOttXkcoxL:22 a=cvBusfyB2V15izCimMoJ:22
 a=Bts-Es6F1CBXvF7u4C_G:22
X-Proofpoint-ORIG-GUID: UGYxABevyeWtMnv0daxGJNVJ3COADCNK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE4MyBTYWx0ZWRfX1s+FD9/ppdA3
 txqurdqiqohATwBOKdri72evFIxEZriXV626ZIdj/WxQ4e44KoX7nmjnvwlbBfZMypzQaqKk4ht
 YAwJYZdch7FvSrYOiuJ5XyUVMejtGIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_03,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080183

On Wed, Jul 08, 2026 at 09:06:52AM +0100, Lorenzo Stoakes wrote:
> On Wed, Jul 08, 2026 at 12:38:09PM +0530, Mukesh Ojha wrote:
> > From: Eugen Hristev <eugen.hristev@linaro.org>
> >
> > With this driver, the registered regions are copied to a shared memory
> > zone at register time. The shared memory zone is supplied via OF. This
> > driver will select only regions that are of interest, and keep only
> > addresses. The format of the list is Kinfo compatible, with devices like
> > Google Pixel phone. The firmware is only interested in some symbols'
> > addresses.
> >
> > Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> 
> Hang on, this is a driver that exposes internal kernel symbol information in a
> shared memory region for anybody who wants to access it?
>

Yes, this was one of the others we could find in the Android
kernel, which could be another use case of the meminspect
backend.

https://android.googlesource.com/kernel/common/+/refs/heads/android-mainline/drivers/android/debug_kinfo.c

-Mukesh

> This doesn't really seem sane?
> 
> Looking through the code it seems you are only exposing things that are already
> otherwise exposed, so maybe it's not so bad, but it seems as if a registered
> meminfo driver could in any case get access to things they shouldn't?

> 
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/of/platform.c      |   1 +
> >  kernel/meminspect/Kconfig  |  11 ++
> >  kernel/meminspect/Makefile |   1 +
> >  kernel/meminspect/kinfo.c  | 257 +++++++++++++++++++++++++++++++++++++
> >  5 files changed, 271 insertions(+)
> >  create mode 100644 kernel/meminspect/kinfo.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 2d816d783024..d805ff9fedac 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16906,6 +16906,7 @@ M:	Eugen Hristev <eugen.hristev@linaro.org>
> >  M:	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >  S:	Maintained
> >  F:	Documentation/devicetree/bindings/reserved-memory/google,debug-kinfo.yaml
> > +F:	kernel/meminspect/kinfo.c
> >
> >  MEMBLOCK AND MEMORY MANAGEMENT INITIALIZATION
> >  M:	Mike Rapoport <rppt@kernel.org>
> > diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> > index 53bca8c6f781..f80bd25fc481 100644
> > --- a/drivers/of/platform.c
> > +++ b/drivers/of/platform.c
> > @@ -494,6 +494,7 @@ static const struct of_device_id reserved_mem_matches[] = {
> >  	{ .compatible = "qcom,smem" },
> >  	{ .compatible = "ramoops" },
> >  	{ .compatible = "nvmem-rmem" },
> > +	{ .compatible = "google,debug-kinfo" },
> >  	{ .compatible = "google,open-dice" },
> >  	{}
> >  };
> > diff --git a/kernel/meminspect/Kconfig b/kernel/meminspect/Kconfig
> > index 18ff511ad4cf..7f6436c3344b 100644
> > --- a/kernel/meminspect/Kconfig
> > +++ b/kernel/meminspect/Kconfig
> > @@ -16,3 +16,14 @@ config MEMINSPECT
> >
> >  	  Note that modules using this feature must be rebuilt if this
> >  	  option changes.
> > +
> > +config MEMINSPECT_KINFO
> > +	tristate "Shared memory KInfo compatible driver"
> > +	depends on MEMINSPECT
> > +	help
> > +	  Say y here to enable the Shared memory KInfo compatible driver.
> > +	  With this driver, the registered regions are copied to a shared
> > +	  memory zone at register time.
> > +	  The shared memory zone is supplied via OF.
> > +	  This driver will select only regions that are of interest,
> > +	  and keep only addresses. The format of the list is Kinfo compatible.
> > diff --git a/kernel/meminspect/Makefile b/kernel/meminspect/Makefile
> > index 09fd55e6d9cf..283604d892e5 100644
> > --- a/kernel/meminspect/Makefile
> > +++ b/kernel/meminspect/Makefile
> > @@ -1,3 +1,4 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >
> >  obj-$(CONFIG_MEMINSPECT) += meminspect.o
> > +obj-$(CONFIG_MEMINSPECT_KINFO) += kinfo.o
> > diff --git a/kernel/meminspect/kinfo.c b/kernel/meminspect/kinfo.c
> > new file mode 100644
> > index 000000000000..7451c13bc316
> > --- /dev/null
> > +++ b/kernel/meminspect/kinfo.c
> > @@ -0,0 +1,257 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + *
> > + * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
> > + * Copyright 2021 Google LLC
> > + * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
> > + */
> > +#include <linux/container_of.h>
> > +#include <linux/kallsyms.h>
> > +#include <linux/meminspect.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/utsname.h>
> > +
> > +#define BUILD_INFO_LEN		256
> > +#define DEBUG_KINFO_MAGIC	0xcceeddff
> > +
> > +/*
> > + * Header structure must be byte-packed, since the table is provided to
> > + * bootloader.
> > + */
> > +struct kernel_info {
> > +	/* For kallsyms */
> > +	u8 enabled_all;
> > +	u8 enabled_base_relative;
> > +	u8 enabled_absolute_percpu;
> > +	u8 enabled_cfi_clang;
> > +	u32 num_syms;
> > +	u16 name_len;
> > +	u16 bit_per_long;
> > +	u16 module_name_len;
> > +	u16 symbol_len;
> > +	u64 _relative_pa;
> > +	u64 _text_pa;
> > +	u64 _stext_pa;
> > +	u64 _etext_pa;
> > +	u64 _sinittext_pa;
> > +	u64 _einittext_pa;
> > +	u64 _end_pa;
> > +	u64 _offsets_pa;
> > +	u64 _names_pa;
> > +	u64 _token_table_pa;
> > +	u64 _token_index_pa;
> > +	u64 _markers_pa;
> > +	u64 _seqs_of_names_pa;
> > +
> > +	/* For frame pointer */
> > +	u32 thread_size;
> > +
> > +	/* For virt_to_phys */
> > +	u64 swapper_pg_dir_pa;
> > +
> > +	/* For linux banner */
> > +	u8 last_uts_release[__NEW_UTS_LEN];
> > +
> > +	/* For module kallsyms */
> > +	u32 enabled_modules_tree_lookup;
> > +	u32 mod_mem_offset;
> > +	u32 mod_kallsyms_offset;
> > +} __packed;
> > +
> > +struct kernel_all_info {
> > +	u32 magic_number;
> > +	u32 combined_checksum;
> > +	struct kernel_info info;
> > +} __packed;
> > +
> > +struct debug_kinfo {
> > +	struct device *dev;
> > +	void *all_info_addr;
> > +	size_t all_info_size;
> > +	struct notifier_block nb;
> > +};
> > +
> > +static void update_kernel_all_info(struct kernel_all_info *all_info)
> > +{
> > +	struct kernel_info *info;
> > +	u32 *checksum_info;
> > +	int index;
> > +
> > +	all_info->magic_number = DEBUG_KINFO_MAGIC;
> > +	all_info->combined_checksum = 0;
> > +
> > +	info = &all_info->info;
> > +	checksum_info = (u32 *)info;
> > +	for (index = 0; index < sizeof(*info) / sizeof(u32); index++)
> > +		all_info->combined_checksum ^= checksum_info[index];
> > +}
> > +
> > +static void __maybe_unused register_kinfo_region(void *priv,
> > +						 const struct inspect_entry *e)
> > +{
> > +	struct debug_kinfo *kinfo = priv;
> > +	struct kernel_all_info *all_info = kinfo->all_info_addr;
> > +	struct kernel_info *info = &all_info->info;
> > +	struct uts_namespace *uts;
> > +	u64 paddr;
> > +
> > +	if (e->pa)
> > +		paddr = e->pa;
> > +	else
> > +		paddr = __pa(e->va);
> > +
> > +	switch (e->id) {
> > +	case MEMINSPECT_ID__sinittext:
> > +		info->_sinittext_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__einittext:
> > +		info->_einittext_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__end:
> > +		info->_end_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__text:
> > +		info->_text_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__stext:
> > +		info->_stext_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID__etext:
> > +		info->_etext_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_num_syms:
> > +		info->num_syms = *(__u32 *)e->va;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_offsets:
> > +		info->_offsets_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_names:
> > +		info->_names_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_token_table:
> > +		info->_token_table_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_token_index:
> > +		info->_token_index_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_markers:
> > +		info->_markers_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_kallsyms_seqs_of_names:
> > +		info->_seqs_of_names_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_swapper_pg_dir:
> > +		info->swapper_pg_dir_pa = paddr;
> > +		break;
> > +	case MEMINSPECT_ID_init_uts_ns:
> > +		if (!e->va)
> > +			return;
> > +		uts = e->va;
> > +		strscpy(info->last_uts_release, uts->name.release, __NEW_UTS_LEN);
> > +		break;
> > +	default:
> > +		break;
> > +	};
> > +
> > +	update_kernel_all_info(all_info);
> > +}
> > +
> > +static int kinfo_notifier_cb(struct notifier_block *nb,
> > +			     unsigned long code, void *entry)
> > +{
> > +	struct debug_kinfo *kinfo = container_of(nb, struct debug_kinfo, nb);
> > +
> > +	if (code == MEMINSPECT_NOTIFIER_ADD)
> > +		register_kinfo_region(kinfo, entry);
> > +
> > +	return NOTIFY_DONE;
> > +}
> > +
> > +static int debug_kinfo_probe(struct platform_device *pdev)
> > +{
> > +	struct kernel_all_info *all_info;
> > +	struct device *dev = &pdev->dev;
> > +	struct reserved_mem *rmem;
> > +	struct debug_kinfo *kinfo;
> > +	struct kernel_info *info;
> > +
> > +	rmem = of_reserved_mem_lookup(dev->of_node);
> > +	if (!rmem)
> > +		return dev_err_probe(dev, -ENODEV, "no such reserved mem of node name %s\n",
> > +			      dev->of_node->name);
> > +
> > +	/* Need to wait for reserved memory to be mapped */
> > +	if (!rmem->priv)
> > +		return -EPROBE_DEFER;
> > +
> > +	if (!rmem->base || !rmem->size)
> > +		dev_err_probe(dev, -EINVAL, "unexpected reserved memory\n");
> > +
> > +	if (rmem->size < sizeof(struct kernel_all_info))
> > +		dev_err_probe(dev, -EINVAL, "reserved memory size too small\n");
> > +
> > +	kinfo = devm_kzalloc(dev, sizeof(*kinfo), GFP_KERNEL);
> > +	if (!kinfo)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, kinfo);
> > +
> > +	kinfo->dev = dev;
> > +	kinfo->all_info_addr = rmem->priv;
> > +	kinfo->all_info_size = rmem->size;
> > +
> > +	all_info = kinfo->all_info_addr;
> > +
> > +	memset(all_info, 0, sizeof(struct kernel_all_info));
> > +	info = &all_info->info;
> > +	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
> > +	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
> > +	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
> > +	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
> > +	info->name_len = KSYM_NAME_LEN;
> > +	info->bit_per_long = BITS_PER_LONG;
> > +	info->module_name_len = MODULE_NAME_LEN;
> > +	info->symbol_len = KSYM_SYMBOL_LEN;
> > +	info->thread_size = THREAD_SIZE;
> > +	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
> > +	info->mod_mem_offset = offsetof(struct module, mem);
> > +	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
> > +
> > +	kinfo->nb.notifier_call = kinfo_notifier_cb;
> > +
> > +	meminspect_notifier_register(&kinfo->nb);
> > +	meminspect_lock_traverse(kinfo, register_kinfo_region);
> > +
> > +	return 0;
> > +}
> > +
> > +static void debug_kinfo_remove(struct platform_device *pdev)
> > +{
> > +	struct debug_kinfo *kinfo = platform_get_drvdata(pdev);
> > +
> > +	meminspect_notifier_unregister(&kinfo->nb);
> > +}
> > +
> > +static const struct of_device_id debug_kinfo_of_match[] = {
> > +	{ .compatible	= "google,debug-kinfo" },
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
> > +
> > +static struct platform_driver debug_kinfo_driver = {
> > +	.probe = debug_kinfo_probe,
> > +	.remove = debug_kinfo_remove,
> > +	.driver = {
> > +		.name = "debug-kinfo",
> > +		.of_match_table = debug_kinfo_of_match,
> > +	},
> > +};
> > +module_platform_driver(debug_kinfo_driver);
> > +
> > +MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
> > +MODULE_AUTHOR("Jone Chou <jonechou@google.com>");
> > +MODULE_DESCRIPTION("meminspect Kinfo Driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.53.0
> >

-- 
-Mukesh Ojha
