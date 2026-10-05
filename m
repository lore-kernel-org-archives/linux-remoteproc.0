Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888A3D9DCE
	for <linux-remoteproc@vger.kernel.org>; Mon,  5 Oct 2026 21:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791234091; cv=none; b=srF359eEc7OZmS+QBLFVnahaUvm/MzSW6Wa1XjX1ajUb8jcIzbLLGbh77H90JR4MxZMPGjeG00owXEAhWF/4/kxZ0Y1SMROv9qawuTiqLuYXkrjcNnGzcOp0oFmf/Bj54z8LYroEowx7SSiohRKlCZZ73Mqps04LeR1DPRNPGGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791234091; c=relaxed/simple;
	bh=xFqM6C0CZtyMMBGakXcZlOCR3J/JBeoJ9lhTaDp82Vk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxZaDLiS0sim8adfW8ay5CSuzwC7V40tbC2HfpI0u2oziYTfjOx9BOb6Cjfq8tMBpj3JxyuK4twcvvGK1qpUSDytg9E/Tmu9j+5yZCShGf6DUWApBpAmw/9m11vO+iiAtOX0M6MH9wV/4Y6fMjtjmE3YmJLrJjfHHBK/ug4G7Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPHkTuPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+wMczm9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPHkTuPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+wMczm9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KN7Cq3925840
	for <linux-remoteproc@vger.kernel.org>; Mon, 5 Oct 2026 21:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y7pVI7SpD5poVIpr/u84Y6Jb
	ABdZdHaInXCo9ZlvthI=; b=TPHkTuPMmwtr7DD6ULAMaaqTBG8gnsuKU6/9oUOU
	4FYm1jhAY5FLBzmu9XKsX62RIXXSm9hw7toQMc6jtGxclm+UZOku0ZLSTkak4mOa
	RD5rPsAPkxrx62phggGDunzImxU2eSHSc5NOFUPQhHpXwZFFZd0gbX7CvPvxWsDK
	MFDdLVsCq9OUPmsFyzUUcHgoTLrEL3AeQ4sj9RQMU6pLa8p9R0k70nqcxrmkMyqv
	DKAT7NiFnCUhOElWiWoZVtdPPHagQYX/DYiR4NfqGvkZN5fNbA1TmylcpRl9OoKI
	mNQCkMde2dhWvbQj/UdanMo7zqJUaYVsI/pFsYjy+JNWbQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u42eeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 21:01:28 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bfee69e500so2155455137.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Oct 2026 14:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791234088; x=1791838888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y7pVI7SpD5poVIpr/u84Y6JbABdZdHaInXCo9ZlvthI=;
        b=X+wMczm9J78v0uJfxxQHGZlZqzcBUgHEiBHX8uYY0iRf2lXDM+jXp9avhrqF+2lsPc
         aYrFpvtXYBgnk2sYc14H+EohWLDGoKUDQRaLY2CIOZkXxlTZVax24+Upb8L3uyMTY2eA
         aAIcU91LmnXYjsSkG9o7tpsKBdfZgpRxNdaGjgP9ecCkW0lSXL7yHMszY+yeoTnYEAux
         wy+rMOfDoDDcYJ6/RsT/aDouC91wU3jfDRtZuy3QAP/JJhHols+IGj/sMOtxu0rIINFB
         hcjCzKdG03q/Qx8jeGbm2QIE1ZfersKliqiID1RxJnAdRhwyCCGeY3CT1/entue+vQV/
         pAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791234088; x=1791838888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7pVI7SpD5poVIpr/u84Y6JbABdZdHaInXCo9ZlvthI=;
        b=0R8vXrz4XxKZMPIYeA/cru0P6ZNeEWTlSuKAs81uIy7ZIwvsqTuxbM5ce9Uc99uR6D
         UlZ+VlD82QVPtbvPq8X4Xc12+lDexDx0INpivipKyXxdxppdr6ZyOIx9GGsbs0jEC2uc
         dkA2hwXakDp5C2QpnxdyDrq7wzSfo40HC/f16lvztTtGpPjhzpSMwEmfWO3EyIeVpSdb
         qJo93mpk9VYhEl+U2psLpvl/9b7HQXSimbirmYt37QP5VsoK0RZTkSawvcZLb/7WYZ+9
         SfCUaXEM839nwXRbBlx00P9+Sm91MCqoJba52Ik3KPf4C2vNcB5acoCCNbTO4Z3jtIHo
         AmIw==
X-Forwarded-Encrypted: i=1; AKwUvByQ6sSsIWWogGAR4lTknmJptQhBR2Vmbw+MQO3MhrOaDm00cKbb41qNJMFqqSFA0fQ9cXgWi1BLTZ1DmbOnaaDH@vger.kernel.org
X-Gm-Message-State: AFq9FYIMgFA+0jRPzyJ+HpkDmZn42Em7jjbCMG3nYsPIQdhoFoPfNiEG
	aq8s6W2559OsRjki7vHAL9BtWhZsCeT5e02OPAbqnnEbMdU4CJSQ6nSlX0DxH4f3fJq5FDg+4+k
	AIgBTP4LU6SIrTSipYnggX9fuM5whazN0FCYzFI1VPDOU5AjeZ4MiWnVRV01I2e8FfFcW/+Bv
X-Gm-Gg: AYBFou1P+9xXA2LV0zrHEYcalKqTzFyyUjqrZKp461oWdkV93V22jqpunbPIyWqbkVv
	TUvwusx9uR/lnp3VC/2UZM/j6HkHbP5m8LttZ9+G8Cc5tQmP0/3qUnHAtozhB9g3P6G5N9M9Knc
	LuRyVSu5weOJskr/5f8Wn3EOa6yYFLkDJl1PHoRze+w9A5ExRRoxvdTJ/sGmlthUZvA+1Ljzb09
	TUpLqSTBVECjwv26q/7F0Ynyvf0J6Du5dN1O7SgVoynPOWIUHs/bZr89HErTjbbKlkKE1B9D5Tq
	bhY5UG/NUobB+6U1n2rlgHmlcwDvlFwpShrBjhRBDbZB/xIQVOD6o6hV7gwH9lT6hX5QMR8RF3k
	90JsjCUOTUReTIXbK6rCFvsHeMPK4dQDx9q9XmSXaOKUKpiRbTHpNWTC3
X-Received: by 2002:a67:e709:0:b0:7a6:c647:cf50 with SMTP id ada2fe7eead31-7c24488c229mr2482398137.8.1791234087736;
        Mon, 05 Oct 2026 14:01:27 -0700 (PDT)
X-Received: by 2002:a67:e709:0:b0:7a6:c647:cf50 with SMTP id ada2fe7eead31-7c24488c229mr2482387137.8.1791234087240;
        Mon, 05 Oct 2026 14:01:27 -0700 (PDT)
Received: from RAMIREZO.na.qualcomm.com (5.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff56136sm143071585e9.3.2026.10.05.14.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 14:01:26 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 5 Oct 2026 23:01:24 +0200
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, andersson@kernel.org,
        mathieu.poirier@linaro.org, konrad.dybcio@oss.qualcomm.com,
        sumit.garg@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom: pas: pass no resource table when the
 firmware has none
Message-ID: <asQQJNOd_p9acgT1@RAMIREZO.na.qualcomm.com>
References: <20261005125411.2151326-1-jorge.ramirez@oss.qualcomm.com>
 <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005161224.umj6zzov57tifv7v@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: whkq-vWomtqUPyvQo7VWlLPZ45cqmJDE
X-Proofpoint-GUID: whkq-vWomtqUPyvQo7VWlLPZ45cqmJDE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA4MiBTYWx0ZWRfX6JUXDtQlPN1K
 iRkuGJZeX16vqLOWlEPiC9RqIC7qU5EX88ftEfDsInIYnsFix1T0xftnrsQxEttvn5v6UHWPcvl
 4YJ+IbEcL1ikD72MLhXKkzQ/CL4O8GU=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac41028 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=nno+U714v6U58lXnMUU6PQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FcOvU0BdSJvtYE76ZsQA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA4MiBTYWx0ZWRfX4tlnFVjvAGmO
 tLtyNNCtrH7ckMsMa/H35hpENhShuHJpZcLooQfd+6R2rD3A44uq6iSV1siEp9tqBgQ7qEQmyyB
 szAwnQtmGs1qdR8np4RWfpBRKZTzDQQNLV28XJ2cyD5sfSHwHzxxtEXhQE3Fn73r9m1EBo+lAqs
 L9rhyydIKzHimYoM22Kr8ChXEAl+pFKsA6w/fzK7ZUi0biLuR4FrMyAoqn3EjR0zvsQ2MYdfkPE
 +7JXggRej/k4PdtBy/bATC2HS6iTY40FaCtzRLihNZxbAeyLSkBXX+xm3/9/oKKC5w8j1EetA0R
 hU49hutdljXrjHjvxCZ/GqCyaYK7J/j00wuP6Y0ZAhWtW35t7GqIyOocQRsF4AFOTF06cfuZFsx
 rgMr4SL3J22GTuWYsG5GL9PuXRM9wBldKwGWGrBxzM0QINRAVnihV/s6gOwKQZ78kOPjgyC35r5
 Wsh5j/udg5pcA5o1X5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050082

On 05/10/26 21:42:24, Mukesh Ojha wrote:
> On Mon, Oct 05, 2026 at 02:54:00PM +0200, Jorge Ramirez-Ortiz wrote:
> > The firmware resource table is passed to the PAS backend even when the
> > firmware carries none. This only works on the first boot, while the
> > cached pointer and its size are both zero.
> > 
> > Stopping the remote processor, or failing to start it, frees the cached
> > table and clears the pointer but leaves the size set. The next start
> > then pairs a NULL table with a non-zero size.
> > 
> > The SCM backend substitutes an empty table and hides the problem. The
> > TEE backend copies from the NULL pointer:
> > 
> >   remoteproc remoteproc2: powering up cdsp
> >   pc : __pi_memcpy_generic+0x110/0x22c
> >   lr : qcom_pas_tee_get_rsc_table+0xf4/0x25c
> >   Call trace:
> >    __pi_memcpy_generic+0x110/0x22c (P)
> >    qcom_pas_get_rsc_table+0x38/0x60
> >    qcom_pas_parse_firmware+0xa0/0x100
> >    rproc_boot+0x2d4/0x380
> >    state_store+0x40/0x100
> > 
> > Fixes: a4584bff63c8 ("remoteproc: pas: Extend parse_fw callback to fetch resources via SMC call")
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index a005546c265d..e871e03ba794 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -463,7 +463,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> >  	struct resource_table *table = NULL;
> >  	size_t output_rt_size;
> >  	void *output_rt;
> > -	size_t table_sz;
> > +	size_t table_sz = 0;
> >  	int ret;
> >  
> >  	ret = qcom_register_dump_segments(rproc, fw);
> > @@ -476,11 +476,12 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
> >  		return 0;
> >  
> >  	ret = rproc_elf_load_rsc_table(rproc, fw);
> > -	if (ret)
> > +	if (ret) {
> >  		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
> > -
> > -	table = rproc->table_ptr;
> > -	table_sz = rproc->table_sz;
> > +	} else {
> > +		table = rproc->table_ptr;
> > +		table_sz = rproc->table_sz;
> > +	}
> 
> 
> Earlier code was intentional please read the comment below.. /**...*/
> 

AFAICS the comments say that the call might pass NULL and zero as input
resources. And this patch does exactly that - it doesnt allow NULL and
non-zero.

did I miss something?







