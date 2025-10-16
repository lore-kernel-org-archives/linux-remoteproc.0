Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39782D8DA8
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Oct 2025 19:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760642728; cv=none; b=DtAnStV6EciCBzQCCZ7BKx6gujgnpKEJUJh6B+APICgNQUBPbCOk0kqg8Y6iUOLHm69rzdI5sb3hmMz9iO/Rsi7QrW7zhswhpSQHc7+Hv6+eLAt+5UWG+bGBy4N+M1tEgXspii9DL4fS/OwmvR20txZmKmNUd+lXVMtvnXDI7nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760642728; c=relaxed/simple;
	bh=CCU56jKMu+W55jmMpGsIbLiO2g/PG9wAmlqXGv4sgIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvRkNljkf7SAivcnxxk8hfekhPTr0pprt/paVgp7b1LcSP82b2+TVDK6JhENyVqQRPpMrH714210QBMRTNQ6n91pEVwuBeBIpDtLbHd9bVhUunmQaCQeSwGLru16Zi2+c5oW1TZhhznMMlX28LIxhNLE5207CVd2tvYI0uWSyWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIQe20Pl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIQe20Pl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GA4gZ8022883
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Oct 2025 19:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lbh0JZUshYKiyc2lneuG2hdFrLCFasxqkus6jGm8OCY=; b=AIQe20PlpmoybnSU
	ukzX03DVDUzqJL5AdIcly90DY9QpfCnyeVv/dW3xW/asKIpJJp9bb0yyfDqZIytg
	JFZ5ZLaZpNfihgTv99P2PCuX558LGOUQo1Y3RWruYYW1Y+1w038bxs1EcfZJehDu
	11DFbfbqQXKNFO0pi+zjzcc3JwlKvuma6Nr0VO2TYydz0CRYk441+HeBj5+XovyZ
	BJb0qArAi7JhVh6ECAwJ95GDwaB8z12UEnSgqIMnXcgapZirrvEHKPMlQlF/6po0
	WN2lMYTcL8RpDjHupDnNNxAqW7v9jAmQCVJPzVgL7sjhNeeB7iba6RDsVQ75xMLv
	DmV+QQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49tqvpjvfn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 16 Oct 2025 19:25:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28a5b8b12bbso23412325ad.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Oct 2025 12:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760642724; x=1761247524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lbh0JZUshYKiyc2lneuG2hdFrLCFasxqkus6jGm8OCY=;
        b=rmURWKidUaaKvxAcTjWK1b/cURxgCHu4DZI9tcyvl/B7wwx+ZQoKHBgPK/G0Axnx3C
         Cj7NkF//OJGRz9/0oCgM/E3cBZdiOKNfYYgIZ41yO+vHlAqRBYwsAuWkuzpJ9F0EkT+B
         ue9WJOeNX8uYj4ptdbsDf0gwyS595EBrtnwkTocx0YzDgiH8F0QkbmZdonycrZIWCY/5
         rpO/q8D9GjGK4fjtWzxlmFaPjSPEbhaAGjjp68YgHcs9Bvp7rBNVHSDW6VcSd7Cxax2G
         ItmW82LZ/OPouDO7xyZhejvLvKjEMjVmSVbNUmi8s5iK7NctwOWzv6XKndJSHChyiwpM
         U28Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWrJBo1ERWKcnkpZYEWhmX4KIQhl9G87l7yTksA9INSV1l6upQyUnzo3Itli+3zJmuSTXtrz9226HIe8oZ6K/q@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuq34esopoGdCEJGbuwaGn0KYpHbtXkdVFQsQNulsK1AeutTwG
	SIwT9lmyplD4J/QIH7Rl6IXh5gGaUuZ7gahpOEtpPb2fHIcLt6nYuc/QgftaCB/NxO2Tn1hmgXS
	YSa2afuKFuHLsm0QEGz0NlNu8NZ2RepgFLPwv1ahQEvIRXjV7Um2+P+aGI9De41fojWquUVF2ID
	UKM6xief0AZtQDTR4P4jNzrebVPDYHarsHFjV70ntJmg3+o8k=
X-Gm-Gg: ASbGncuOR3LzQHSAMTD324MqB9KmQIIksD4QkW/wZLyKkhypL54lN65g7wfvWL/Bdym
	tnxReNFM6rrtdYAlhKK0Fpxs+6xPM5bYpmW8FtovAFNbSagxx9of8tZjQI5Cx3bDqSFCLVb0BgH
	psWA3tFIg22jz1SEVx+wgYQ74TZ7Ix+Is8jhgiYXOXpSeAuSEN8wo5NlIe
X-Received: by 2002:a17:903:15c7:b0:269:b2ff:5c0e with SMTP id d9443c01a7336-290cbb49964mr12082105ad.46.1760642724458;
        Thu, 16 Oct 2025 12:25:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUo1sf7y9UCTcepHJ9i7RqY5zJv2p9Jgs22z3Q/2raqaie7S0KERNQ0h0ERxNG35cN3dlT3qcKoE/W74pbahw=
X-Received: by 2002:a17:903:15c7:b0:269:b2ff:5c0e with SMTP id
 d9443c01a7336-290cbb49964mr12081735ad.46.1760642723824; Thu, 16 Oct 2025
 12:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250828092615.2114183-1-souradeep.chowdhury@oss.qualcomm.com> <ud4nodcdhxr4pux6nsvqzaclqrnmct6ehjr5bmsxdgjby5xs4k@4c23gunpbf4z>
In-Reply-To: <ud4nodcdhxr4pux6nsvqzaclqrnmct6ehjr5bmsxdgjby5xs4k@4c23gunpbf4z>
From: Souradeep Chowdhury <souradeep.chowdhury@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 00:55:12 +0530
X-Gm-Features: AS18NWA_vFJNl8vztBLwAevewl0Ft1SgCKgxPX-aaUmsnifQALtgx3ww5dEy5Q4
Message-ID: <CAJek3sLVvd_wqHddsuc_n-Ob6Mm1Yyas0RqvZ-Mopy5m6rVidg@mail.gmail.com>
Subject: Re: [PATCH v7] remoteproc: Add device awake calls in rproc boot and
 shutdown path
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Souradeep Chowdhury <quic_schowdhu@quicnc.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=aPD9aL9m c=1 sm=1 tr=0 ts=68f146a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=jGnfN1tMAAAA:8 a=EUspDBNiAAAA:8
 a=c8bG8LX2rWeYhf_pb54A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=6MwZEyB11foWsxG17m01:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE2MDAxNyBTYWx0ZWRfX/4MUHH7vwjM+
 WA6FrwEcdhrnUHRMk03QyEFTk+RTUjiVqUPQu3hRrCZ1yHiKmbMStwai6XJehD8y8shsrqN3tI1
 8G/i9ehSnq6qMqL0a74km4QsVajCZOGFxTab8peRaq44wW+cwJbJp3YccmjJAZmnwi8VRqXq7Q8
 b20PZuD5iGFg/Z/xJNQOdpKI+1v9XMuTFz4HEEYQaoCMXDL+DzIXTnMTyVYNPp9PCK/aVNU2/by
 Dn1+NXTkKTMxxwX1KXqlsWcOJSimviyE7/rq53AIjVR5TdtxIo5qjNY2SyxScJJjgG9R3VrXDIc
 aAsjWYy6VvXTEs8UVyHzeVc8KZMPmXRHQLTPaKP2Bn+oJDE6wF3ZRyhBss38mC0tm4Be9tLNEZp
 Z+q1ij8loxC2w6TvtAGWTIPv2S031Q==
X-Proofpoint-ORIG-GUID: oSs73xsxgmS8kwsO-O3sj5xwkKEMQJOL
X-Proofpoint-GUID: oSs73xsxgmS8kwsO-O3sj5xwkKEMQJOL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510160017

On Sun, Sep 21, 2025 at 8:30=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Aug 28, 2025 at 02:56:15PM +0530, Souradeep Chowdhury wrote:
> > If an user stops and starts rproc by using the sysfs interface, then on
> > pm suspension the firmware fails to load as the request_firmware call
> > under adsp_load relies on usermodehelper process via firmware_fallback_=
sysfs
> > which gets frozen on pm suspension.
>
> How does it fail? Is the firmware load aborted? Does it time out while
> we're suspended?

Firmware load is aborted due to failure from usermodehelper_read_trylock().
It returns an error and there is no timeout.

>
> The usermodehelper is optional, adsp_load() doesn't rely on
> usermodehelper, it relies on the firmware class, which might perform
> usermodehelper.

yes in this usecase usermodehelper is being used.

>
> Please describe how and why it fail, so that help educate others (me
> included) about what the actual problem you're seeing is.

Sure, will include further details in next version.
>
> > Currently pm_awake calls are present
> > in the recovery path, add the same in start and stop path of rproc for
> > proper loading of the firmware in non-recovery path.
>
> I would expect/hope that the git log tells us that the pm_stay_awake()
> in the recovery path is there to prevent the system from being suspended
> while we're restarting the remotproc, as this is expected to lead to
> functional degradation and suboptimal low power state.

Yes,this was merged as a part of the following patch:
[PATCH] remoteproc: core: Prevent system suspend during remoteproc
recovery - Rishabh Bhatnagar

>
> "They call this function over there" is not sufficient motivation.
>
>
> But just to be clear, I'm not saying that this patch is wrong. I'm
> saying I don't understand your problem/motivation.

I have elaborated further, hope this clarifies the issue.

>
> >
> > Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicnc.com>
> > Signed-off-by: Souradeep Chowdhury <souradeep.chowdhury@oss.qualcomm.co=
m>
>
> This is both you, no need to carry both.

Ack
>
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v7
> >
> > *Justify this fix by adding more details in commit message
>
> Please start use b4, so we get proper links to old submissions here.

Ack
>
> Regards,
> Bjorn
>
> > Changes in v6
> >
> > *Add some correction to commit message
> >
> > Changes in v5
> >
> > *Added more details to commit description
> >
> > Changes in v4
> >
> > *Remove stability from mailing list
> > *Remove the extra tab in v3
> > *Change the commit description
> >
> >  drivers/remoteproc/remoteproc_core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/=
remoteproc_core.c
> > index c2cf0d277729..5d6c4e694b4c 100644
> > --- a/drivers/remoteproc/remoteproc_core.c
> > +++ b/drivers/remoteproc/remoteproc_core.c
> > @@ -1917,6 +1917,7 @@ int rproc_boot(struct rproc *rproc)
> >               return -EINVAL;
> >       }
> >
> > +     pm_stay_awake(rproc->dev.parent);
> >       dev =3D &rproc->dev;
> >
> >       ret =3D mutex_lock_interruptible(&rproc->lock);
> > @@ -1961,6 +1962,7 @@ int rproc_boot(struct rproc *rproc)
> >               atomic_dec(&rproc->power);
> >  unlock_mutex:
> >       mutex_unlock(&rproc->lock);
> > +     pm_relax(rproc->dev.parent);
> >       return ret;
> >  }
> >  EXPORT_SYMBOL(rproc_boot);
> > @@ -1991,6 +1993,7 @@ int rproc_shutdown(struct rproc *rproc)
> >       struct device *dev =3D &rproc->dev;
> >       int ret =3D 0;
> >
> > +     pm_stay_awake(rproc->dev.parent);
> >       ret =3D mutex_lock_interruptible(&rproc->lock);
> >       if (ret) {
> >               dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, re=
t);
> > @@ -2027,6 +2030,7 @@ int rproc_shutdown(struct rproc *rproc)
> >       rproc->table_ptr =3D NULL;
> >  out:
> >       mutex_unlock(&rproc->lock);
> > +     pm_relax(rproc->dev.parent);
> >       return ret;
> >  }
> >  EXPORT_SYMBOL(rproc_shutdown);
> > --
> > 2.34.1
> >
