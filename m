Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2116439A064
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 05:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897798; cv=none; b=ckpgnUMEpLrYzKGUL+8FteqOzik0bYcCKa7hOIzpRqrlKqrYkHvaWM7mq7JshwSq5GEYnJVuOSZ3BeLlGv3LhOtisfDT/zTwoKw964mrIl+GnxwsIruTNXnU6A9Lv5bpGCm7mvH+Mc6QqpaNKmV7OAdPcZE+TCJOHpuE3pjmZbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897798; c=relaxed/simple;
	bh=291cg8TD3kpoXlfllz9rZA/eIcwGuMaqduHxjVsDkFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sr/Fk8LmSQJuffU53pNkvSUeWY4O0/abdWb4U+FzbXtDaguCAJo78xtCV5R1YgvVyHLpzQKohUQfR5sRXrBMZZ+Wd31QQjdqYaelrzdSfxGUFSNIZrjbgffdcROkOgtJHF2UOxBau6FKsz+YdzhCSmptsSqvigdsoRmVZH1MmHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PpO7nktX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNglMKps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpO7nktX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YNglMKps"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J1MNTX004962
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 05:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oCPdlx7lP7sKdBDO0spE8Aza
	Qewbag4QE1OB75aFRLA=; b=PpO7nktXN06lmAR2k4/UsoFvisD7DERrQ8Bg+DKo
	sTFtB4EyzIQ/KNcKxsjEBAJqfesVN1KIcouWzujXFY6+w1Yns/9PW7eXjEcO/jXV
	0zA8jJvaOkhB/GlWDYW/H2srrtOTAvqUSYAL+c23lI48SbFCGSkwXfQlTJ+7RZYo
	qK3IuNq1yyX8I61u0NNqJutHCS+cWLPEVnd08A+JgHGtjizIsGeApWtjizVCHeS0
	yYuURfQHqDhjaEzf/ezqwYqWitGRViseb1boNcFx9XmtpVQFnA375ouTJyFG0Ct2
	ZbTAK+w3RZ+YPaYMfykR2Udi+UBHELNydcqcwmfwHjaHnA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyyhga4s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 19 Mar 2026 05:23:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091ee9f1d8so50243921cf.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 18 Mar 2026 22:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773897795; x=1774502595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oCPdlx7lP7sKdBDO0spE8AzaQewbag4QE1OB75aFRLA=;
        b=YNglMKpsS+0S+d4iGWyErYg4lgpQpFE6rHDujntp58GoKw7Yr5F5FqnM/SSYUEUHyb
         bmfS9TI0GGFTeykhF964oA1hI9lUeVLd/pz3iOQb1QKhq8KLK4+VTDz+ZOvfg2oCMTBn
         LXcQMC0ouo0HOUsBvbTH2hqzUnClPJsa3h0NevOgfx32r276boQJyVYzZ2jwuRSqYe5L
         pIK0mMV45oUfvcdcrCIvIh6t1AGyvD+ys5PAk63ytAg2XlthOO1D8Oaduyggh0UB5ZvN
         OxWZ545XurjjM9u8lUBeLo5zHf4lW8B0Cw6uzRZYlulAQvtO6Ugk+xwfnh+h7DUx6psm
         4bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773897795; x=1774502595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCPdlx7lP7sKdBDO0spE8AzaQewbag4QE1OB75aFRLA=;
        b=rwoWI/pIYbzuyFZYdnjlYiElh+TLMVSt4mXJyVrvnuyesW8lAXNaLgqvk9SD4yIM8r
         j4olsyLLu2vPZrG2e5K/VwGllkPmZvTGZJubJfsl1C27HeH44I37eSr02jCa6Wuujzru
         5QK5iRSGU4nh1At1MlzZ/LG3Pjo2I+uANNO4G3Iww/n5Fteej0/gt0NGHNK0coMxl91H
         Tk0deydqdHiqR2ousRufL5UIfFqDcsk+kw0W++YUjSUxw73cJclBfx57skEqm3J/0Vae
         evwTZy4GI6kDbxCx/WozfDszfSeW5ZjryAZFWknXwQlR5CysIeq6et91V8sGX8/pBYgI
         oKLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyq84w7gJwQikBCKs38YJpMwqSXKXwfQIZEPDLuVhsK4N6soZeA/ZHqYxPlVcI/0Hra1MKA61/p+xhJrA6J3kq@vger.kernel.org
X-Gm-Message-State: AOJu0YxglahPeNV6NQWgIzyZMhwQPPanSim/RsyfFVFdCfrc8p+6vX4s
	bsuQ2sB1Ovxo8ijyfeeNBP2T+dkss+G521MqeYO+lUymjWKZuY5SAzny1+nMeO3pENVHlOpxnLt
	9bDZ8q4m/6K38N9HeKdKI+M13GOwHwUazseT9BYOjLhqnqYJa9XVJA6e8qduZtDJcvnVI71tl
X-Gm-Gg: ATEYQzyHYYwqjlzvaXaFHeHFkVIM3V8dHa1uNqcvFQFr0p1xQDO1ehlkOcQcl5NzMDs
	4iY5/7XW2TIw7X1krB2r3rjcyKyytjAtgWx01DFFzHx+kOhCVhkMkktbIXLr2lULxAvsy4JpEsW
	ScqCPIXARNOyODyZZPKp8lhumROdofKaPJr2Tw9up4zZh7+15IdidghhsY87cEDDf/5An331ibW
	HWSR0QTRc896GPfQNcgVdNK+Cc5fY3Fu0dcXs9MjwVrPFMlVDBVNvdJnstwMiEkyp6UbkHNzsK+
	Fvbrfbvb5mWSrKfKn+jq38jKplm3Gb/w9YCv38vt/FUWUuaRhXLsRm55Q656j3QJ6Ilc+tGsZWp
	CCO4nuVMrkP+bPsv+Z61WniPFryXxPMPgKlICTKqBc5BKY0bpXyktE7KJEi91IzwdGVmcJLL4Wh
	axWwVTGfNU0VXv+4CBSmz9zBslRi4lMyhaczM=
X-Received: by 2002:a05:622a:a89:b0:50b:2d6e:5253 with SMTP id d75a77b69052e-50b2d6e6d96mr2679321cf.41.1773897794923;
        Wed, 18 Mar 2026 22:23:14 -0700 (PDT)
X-Received: by 2002:a05:622a:a89:b0:50b:2d6e:5253 with SMTP id d75a77b69052e-50b2d6e6d96mr2679211cf.41.1773897794477;
        Wed, 18 Mar 2026 22:23:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a279c3046esm959719e87.36.2026.03.18.22.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 22:23:13 -0700 (PDT)
Date: Thu, 19 Mar 2026 07:23:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when
 doing rproc_add()
Message-ID: <c6qnvfiknlaofts2kdahbaweiufqitnuni6bhqoxznhxp5zdto@m4i5thd57wx7>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
 <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
 <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
 <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDAzOCBTYWx0ZWRfX2+38imCqpXiF
 1ETaMf+y7GmHF06OKObJ4v2GAgRsN2nSXKG0qllPGnUE/AW6RP6XKH4EOuMi9KwVtP8nx7l0JWl
 jyxf5bjcEq1E8IZryZyiTR/FUqW9q006e+slnVsB9cmXjoWD16HbL7llSJtQBOhXIlGmJrub6TO
 hnkeift6kYyM6bcNX1s/53q9PkPHhZMDTNb2WYjBEjaeF7R//5aULp0XQI186bdDfnjehdFAPVI
 Do0lH9hyXZmar7cPclhJ17t8qaDQGM6l17dzlEyRvGF67foBOCI4edUZc9yIS8r9zQrqqVn420C
 q23PIwRyuEQ4RS7ERiTAIbK7N4I0FUfi2Xchxirg69eXpFu/+KXZOZLGrtqKg1rh9pCL1/UZ7Ms
 oP2LP/j/UP/uXE8uFKlPtRP5CEwRlp59PvYDWA518mO2RCyvRt+5pziLga9hEmpPejvs9ONnzMM
 PT8PQrIl956Fg405DpQ==
X-Proofpoint-ORIG-GUID: DLaKTXzCEB_hBuMZwlSvZ6UqHmELtho7
X-Authority-Analysis: v=2.4 cv=IbSKmGqa c=1 sm=1 tr=0 ts=69bb8843 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=5-mz0bjoLmJCLkUxotoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: DLaKTXzCEB_hBuMZwlSvZ6UqHmELtho7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190038

On Thu, Mar 19, 2026 at 12:36:15PM +0800, Jingyi Wang wrote:
> 
> 
> On 3/13/2026 10:37 AM, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
> > > On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
> > > <dmitry.baryshkov@oss.qualcomm.com> said:
> > > > On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
> > > > > 
> > > > > Ideally things like this would be passed to the rproc core in some kind of a
> > > > > config structure and only set when registration succeeds. This looks to me
> > > > > like papering over the real issue and I think it's still racy as there's no
> > > > > true synchronization.
> > > > > 
> > > > > Wouldn't it be better to take rproc->lock for the entire duration of
> > > > > rproc_add()? It's already initialized in rproc_alloc().
> > > > 
> > > > It would still be racy as rproc_trigger_recovery() is called outside of
> > > > the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
> > > > must explicitly call cancel_work_sync() on the crash_handler work (and
> > > > any other work items that can be scheduled).
> > > > 
> > > 
> > > This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
> > > but releases it right before calling inspecting rproc->recovery_disabled and
> > > calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
> > > lock and rptoc_trigger_recovery() should enforce it being taken before the
> > > call.
> > 
> > Yes. Nevertheless the driver should cancel the work too.
> > 
> 
> Hi Dmitry & Bartosz,
> 
> rproc_crash_handler_work() may call rproc_trigger_recovery() and
> rproc_add() may call rproc_boot(), both the function have already
> hold the lock. And the lock cannot protect resources like glink_subdev
> in the patch.
> 
> And there is a possible case for cancel_work, rproc_add tear down call
> cancel work and wait for the work finished, the reboot run successfully,
> and the tear down continued and the resources all released, including sysfs
> and glink_subdev.
> 
> Indeed recovery_disabled is kind of hacky.
> The root cause for this issue is that for remoteproc with RPROC_OFFLINE
> state, the rproc_start will be called asynchronously, but for the remoteproc
> with RPROC_DETACHED, the attach function is called directly, the failure
> in this path will cause the rproc_add() fail and the resource release.
> I think the current patch can be dropped, we are thinking about make rproc_attach
> called asynchronously to avoid this race.

Isn't this patch necessary for SoCCP bringup? If not, why did you
include it into the series?

-- 
With best wishes
Dmitry
