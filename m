Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43BC26ACC
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 10:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175316; cv=none; b=d3u1ICXApvEfvjo5ruDTwl5mHNALhzErrE5IRGHqmyt2hlv/2GNxLpLE78rZsxicZPFL1oNDH5QO4mefR799058tpF6aKfTOplPu0Q5NQV9MQa65G+0Oo4lwO+DW/Mw5L9k7V/AL3/hoX/BRTdJp2yZnNwS/zBkNc9vkcV+6l3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175316; c=relaxed/simple;
	bh=ir0S2IHNu325qUF6z/3Wd6Bqdq9SL5Fszc/vUycr40s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e2knT3JFtzbgV5mDo6cYaGu57R7Yn5t5RKYtlPCRGtNqff+HowbPdoG+k8ljA9jTJerBoyDRKaQqpL6x2sl9X5WrI8kp8cUfnc6pgf5CM4amM066FnrlmqUJUZhNW9b7NNmCRJO7sc+cVlKa0sTAUjJJvj8+G+gtuIHOXfPv9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DOc9/jHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lu7fuXO2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DOc9/jHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lu7fuXO2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xL0x2890671
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 10:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs6iyuQkonYMhtr1jt8Wuq4I
	vNl34jXhaz18EQRcVOg=; b=DOc9/jHfdoUnMtuWTa/KyYyB+1IpWcYXQXIBSS0W
	R41e+4sP3sBHT8A/DIq0GJA69tazRJ90WXuk0jHktfCa12OgF3OciVifXUcuOPYe
	tP6jClD+NKSqx27k1NI1prV9it3hRo2gjLVvCdKEEHlXIaqLzUZO/ZzhTGB/E7iF
	CULfTloPrIH7A+tgNlbftnsGwUXOdwnu3DyIOrW2adCBHj9bcZzcxEogfTbGs2t0
	c1g5jiGLqgx1SeXdYdOQPnOPGQprbErssrwGVDjsElCJMPAwV910VD57s+qFjZoM
	6zzJeb/VrRqLrLaj8aK1ZMB3qtv4wThqSXpSHGT6UVgplQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k00q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 10:55:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8422b544a4bso5031020b3a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 11 Jun 2026 03:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175313; x=1781780113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs6iyuQkonYMhtr1jt8Wuq4IvNl34jXhaz18EQRcVOg=;
        b=Lu7fuXO2ecScQqwUvrgKvdmWwYbV0lS9C9IaN+HgoBFltqyPTuY8XBjJu9TsGD3YJK
         FHPS7In01K5w3xZuCZaxAv2PLhH5hQAJkcq2SB4sbW8lZ5w/HAA8K/VDHTrXRVOEXQOd
         P2CRpFc+kMlBsQA3/AHe+KTa2TtxfjB63XDtK47PweYSXjgt7+zNTDAhCrC771lhTpbv
         N2jX975ZsgwcXHLkhykZVECLp9FEjhKda9PnKgwhq9pekHACFeL1qz+K3aVzrSzlE3WE
         ZW+C7YaUAzY2Q6bN/L0K2Rl59Nyrr6bIxpjS21rhlpIKFRgTZNNyfr9QcbklkvYvXT6J
         9xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175313; x=1781780113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bs6iyuQkonYMhtr1jt8Wuq4IvNl34jXhaz18EQRcVOg=;
        b=UxLsn+WRh9vbJsgSmhwHANShrmICedxBpeHBVDihF24C7NPxhNtrGUvIFSv5qp+L8H
         9TlS9JDGJoPtd5q4DGSTRXQfpnT3WC2b5c8i3VKYSeL85t5c+rB4xh14IGg4n0tY8bJy
         1Gz8q1vTN2AaOVO+lpYnryZiq7yYkvusv9gHsL4mgRX7VhSq3PoPi/UZSive4MyT5Vvm
         t8rbNmY7q1/Y1zZBNYUYtaOr1F1R722itxZ82oHMlciM5oAhx64DxqrUAMFUiXdOsJ/p
         63wmCgUZsa3/acJ3/9V1saDxi0mbJQrC9bkwkEqnfCOYeN2Z+rl+u/aZ25xsIu/HSqQo
         1k0g==
X-Forwarded-Encrypted: i=1; AFNElJ87ZY+zv0b0Tbh8wrmeYvyVqyZZnaUmlUgvn8T+7GV662tiYSdxLHncEpqUHVJSix6il557Jv1lg+iNYvZ7y6Dq@vger.kernel.org
X-Gm-Message-State: AOJu0YzRci3xFNoizkp2HlOi9VSlAdiiOBnVFk0YJuYk9TFazPg8oMyM
	H0XdHJU5r+m+cN6zWpUJv4FqIELhQ9C5+6st66LxSqVe27MzzVHXp7kiGhqpHcRwCsjbdnt+IZG
	gzObAQmVjCH4u6uCB1dEjC5NE98Bc/XDYbBdswkYUI7ceFuQgEIsmew/GRBT9pQBz1xRwcgIm
X-Gm-Gg: Acq92OGrN1qtOSb1XoX4l9az6bFAgR6BTFnjrKJ3bkL+y6WFvBvAGdXeV//19VASs5C
	MDcvuVOXKaqUFrawznTaT8ZPMNB1SpeQLA7m8REmCtNc9xPaWWBO2IE+jah6KEp8Fm8SH5Yw/gM
	3oszMlg31xMkUv+RO60XaddIf3vvHFzxhT5Y9V+azKeVBZEWPlMi4FJKLH1SDjxoZm/NEAYe8ma
	VZ7kABjGG9WZ2FtuRa3UnjmZKMCvuDyaQ72RHJB+FKHzZrbr56FKTcCg3Cw2LDnPCXdFcybkFXM
	PqaGDeEPIYJ0zPQlK62erCFeKIDnvgvAFvDFJqHHBaK4kC4lRZe1yc7E066pOkyyFPe0eNLasOi
	b62RuxPd7P5jqaa1/R1G9cRUaaFZGa6iEh+RpTzDgXBzkdDYBch+rUO79k7c=
X-Received: by 2002:a05:6a20:cc8e:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b5e3423497mr2785539637.46.1781175313265;
        Thu, 11 Jun 2026 03:55:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:cc8e:b0:3aa:c964:3c27 with SMTP id adf61e73a8af0-3b5e3423497mr2785490637.46.1781175312705;
        Thu, 11 Jun 2026 03:55:12 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c865861242bsm1588153a12.18.2026.06.11.03.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 03:55:12 -0700 (PDT)
Date: Thu, 11 Jun 2026 16:25:06 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <20260611105506.llvya5tda4xsd2lo@hu-mojha-hyd.qualcomm.com>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
 <aiqF5mh1PvWpH3L5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiqF5mh1PvWpH3L5@linaro.org>
X-Proofpoint-ORIG-GUID: nTWuzmwKmHlxqtWP14nJIy9bFhpvhmCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfXxJokYAYzrwro
 j4DV+CRv6kUtYypi94QxdeEiFeTgXOa+0tC6OAnSQwN+aNXulf5AkCgq338hc2Qrfn2ULJ29rMy
 U83rogtsnWOUJruR/zdTqsR8CD63e1qrDDY9ToDMrW7VKdOh+UcUz2hMOZpxrs2Akm5zWkwwWeM
 vVbxHS2dk4QWPXoS69UOHoi1MY95EfpSOyoNrZ6MDJTkJ53CMPkxMV3jyJa35jtEQfaUFdbWJWa
 pPY9p1NijOZKO2P/cfay227qq2KRXnrdsLUg6W0spLau7nSJgGlyyThaMh7QSgHGy+gl/653c+Q
 dom/5HHzSghH1w/1D633l/1Ytvek69ECM5K61i8ZVtgB3OvgdtZirbz9rKIRjhq/F9HryDfUpzZ
 T3kflVn545zwR2hmQXQ1o70gD2qDLwHkX/a5suYb1J8Vjik7cVTnQTDmZyqFPTNrr6OdOPFCJ/l
 B6PNvOO7YaFr4eVRU3g==
X-Proofpoint-GUID: nTWuzmwKmHlxqtWP14nJIy9bFhpvhmCb
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a9412 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=84n_F309gJwyGcasrqEA:9 a=CjuIK1q_8ugA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEwOSBTYWx0ZWRfX2j6xEJiAOs1d
 XJ/CN+efUbR4rhDtYubgPLu26c47q6//Gqz7y0htbGQWRr16A23zJv+XMzS+hwughMXzzNLj3OZ
 YJozOzMa/7PRGimd+SHgVNF+aO0u3k0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110109

On Thu, Jun 11, 2026 at 11:54:46AM +0200, Stephan Gerhold wrote:
> On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> > On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > > If a subdevice fails to stop, it indicates broken communication with the
> > > > DSP. Continuing to stop further subdevices against an unresponsive
> > > > remote processor could close rpmsg devices that could remove the memory
> > > > mapping from HLOS and in case if remote processor touches those memory
> > > > can result in SMMU fault.
> > > > 
> > > > Change rproc_stop_subdevices() to return int and abort on the first
> > > > failing subdev. Propagate the error through rproc_stop() and
> > > > __rproc_detach() so callers are aware the teardown did not complete
> > > > cleanly.
> > > > 
> > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > 
> > > But what would callers do about this? If you abort the teardown sequence
> > > half-way through you now have an inconsistent half-stopped state that
> > > neither a new call to stop() nor a new call to start() could recover
> > > from. That doesn't sound much better than the SMMU fault. Or am I
> > > missing something here?
> > 
> > SMMU fault result in device crash while other is non-functional remote
> > processor. From Linux side, we do not know the state of remote processor
> > when the timeout happens..cleaning the subdevices can result in the
> > debug data being lost for hung remote processor.
> > 
> 
> Ok, but how do we go from here? Do we expect that the system would have
> some userspace monitoring daemon that would collect the debug data and
> then reboot the device to make the remoteproc work again?

I would expect the manually collected crash dump in this state to find
out the exact reason for remoteproc being stuck instead of ignoring it
and claiming a graceful shutdown.

Whatever we do here, the remote may be dysfunctional without a reboot,
but cleaning the rpmsg device will clean all the required debug data, or
at least if possible, tell the rpmsg driver with the rproc state that
shutdown was tried but was not graceful.

> 
> With these changes, I don't see how you would start the remoteproc again
> without fully rebooting the board. Calling start()/stop() on the
> subdevices again would lead to crashes because some of them are in
> started state and some of them are in stopped state and we don't even
> know which one is in which state.
> 
> Thanks,
> Stephan

-- 
-Mukesh Ojha
