Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B283D16ED
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 20:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776888260; cv=none; b=px0RykiX7z4iXbUats08NqUP7X7pZJbM49D/lmeFkuMUQqa0blSHXtbH7+welqwEQ6DZy0M5p3PU2rqFB+v926WCQMipELxJdYrApFm9c4n1Nc01iDPfo5BzImXncclwIzIIs/SXhQSzPNAyKuX3KobH8BcLeV/atGAsfFFb5CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776888260; c=relaxed/simple;
	bh=Vw5lbIz93bfPivnPlgZTf922sy3wFpATm4HMbXkasxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgsZWUyyvv5RUNeZdwVWc0pdLxbNWjdcFnbSd2OWnVQVibHSTpeI8Xh9ul1/5d9dStxp9rjXd5QuaR2vDlJOt28UtPtZx1jkN0MQy8cWOzK3X+QUQ3B3nRVr4qqRQUy9ZLltwnXt91BHlazEWPNPFHfcIcfRXHgXnEzJDFZWikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtLDY9uF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IgovRglL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YtLDY9uF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IgovRglL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFdAIO664097
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 20:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TWNv/n77xtlQNACjJ3+8jJLY
	WYV7KxtU3j5KJIFZm9w=; b=YtLDY9uF5xOkCoR8E3Hapt6dWg8lw9y4CViURo4X
	3sj1xGiBYjfiOlGRP6eA/ix80qQtgSD5BDXQ3OUdZi2TY8vDwvtnHONVZG5N4Mtp
	Evjab88v4Ddg4qOo+pRr/xWx9Ns8qPgqG9+E9Y5FUY1c+m9NyDi490VZ+5rT9V3X
	rNy5DzOcpX3JpNZdLuhslsk3tCP+DLqiJIYsqlrsEn3PjEuWX87GqgAERsSGEPLs
	4Q9NPD4F4ixz33UAUspYkKvlTw16b6m5PgJ3Hig/XunesxrltP8r2sSMMsafu2is
	qNEkRl9ZPlkFePAbtM2xVw8xZtpC76DJp4eX5vb3NdhhPA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgtd24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 20:04:17 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-620f5085c37so42931137.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 22 Apr 2026 13:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776888256; x=1777493056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TWNv/n77xtlQNACjJ3+8jJLYWYV7KxtU3j5KJIFZm9w=;
        b=IgovRglLjqALlavWRYhryS09AZfjTpUyQgJZvl5VWXz3kRma5ipHqIJlski6CIlXtu
         4lCkRaR9TqzZxGL9HQaTCtf+5AZsN8okA4UlztxlaRh6pmY9DbJGLPq7gmKzPSoNyo5V
         qPsROGu4eN6JFKo9Qndiw2Zbf2YnrUlLQPCC8gNJpO9E54KFvVKe8VY7O4AZbP0WcaEm
         SHBol4kMEsW2iKDBlIiwnmzUAKb2rzp49f1Y/RL8NJ+UA8/4mY+ErZ7WyizGV0U37hJ3
         eCocGU1RM3QOuh7wHHnNaLDuv43OSkf+j2Tf2elJRQjWPJgo6DjsjHM8DK3o0zwRsrLv
         In2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776888256; x=1777493056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWNv/n77xtlQNACjJ3+8jJLYWYV7KxtU3j5KJIFZm9w=;
        b=AlTS/WuDxz3FjvM5NbCezweqZCSyiNOPhp1//qvK3FNcsJ/s4GH/RqKTXzOqrV1myy
         ZZFJCf2PqtjrIW1yYKoWaqQV5nbTPVs4ccXHTlIWujRcjost4uVys9GWh6PMTu3BxEmr
         Nb/mzb9x7MNtb3g+vcUzBiCmm6hIqe+kY68K7ABS1hgy0rFP5zMAo9lYeY6iBuW/+EIf
         GQqbyDsScFP9BkIuqk79CLHPA2Z2j0TqA2OZjr4nAfIO/EvmDf/HbIyGNz7WFvWG30uY
         Au0sK1Bi+HoGf2suiIl0KspA8wACdMlyecsxDICFTBs+R0EQek/MLWVsVcoXZwSV6ErC
         Q6SQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bD/8jrQhg3KHc+OBn0IQptSZ3XjckhvMA3PBYEsXjzv+teWZsggRRxU/JjHIfw+7IFjz86zAQh8Es3Og9d5w0@vger.kernel.org
X-Gm-Message-State: AOJu0YwwL2AYkqrnWZeWnbydTpkBjQwo7aBR5IRFT39/ywmA+iKQ00m6
	CfsB6KAF3Trh1GOvicUp/H7yZvU0WJ0YMA2EjDl7RziXONckn51nwxtKwKcOEEdBmYo8rsCjgjF
	TSoE3SXnzd2epnn84UeoGmuMAO9AiXPS1eVCq8U46ftf1m03p6pOql69ZM+nIEo1bruib8KLx
X-Gm-Gg: AeBDiesJn4y9SM26qpuKA6HQ+gf/VENvKsNL1fninw/E89NfAGTP95CCtRGSZo1mVeK
	hvW2Tp5buQVKJZ2XLlMVER8eE44BKBV4Fpdyrnqia1GUJYhuZWQBiVckmKBtVl9qeKnp5CuboUi
	Yl7k8fWX8s4IYrmh+YxYKnxR7MWsNUn70JOc3WcfuUSt1KcrIRp6j0k7hP8cfNb8aukuDkXbMaz
	Q4J3uptKzOL4t4rnPU5eahJCEoUBXfChhmQjykTX9zL8m3UJYPkUl9+tcNAQYjcL6Vm0+dFOvPI
	sxtTKh1LezfwtKF+8sVep9YA4aIY80r8QFvExnXWMFvijwQiQ7Q2xyc0EGK5llcGzcJNvzwHEMV
	0gzv+SJMKnzcIs1mcFg+YdsT2sTus4U95zi42ddF8WapYcxSUUW7URPoMvvTUlN7S2+ddQ6dn9a
	vnSywNtOF23y6wCaDPisbTct5LfHu1zS0o/q8MWBHqR4d2Xw==
X-Received: by 2002:a05:6102:f9e:b0:609:4d86:77b with SMTP id ada2fe7eead31-616f73fb077mr11984434137.24.1776888256335;
        Wed, 22 Apr 2026 13:04:16 -0700 (PDT)
X-Received: by 2002:a05:6102:f9e:b0:609:4d86:77b with SMTP id ada2fe7eead31-616f73fb077mr11984380137.24.1776888255894;
        Wed, 22 Apr 2026 13:04:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc25csm4689196e87.26.2026.04.22.13.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 13:04:14 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:04:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@kernel.org>
Cc: lumag@kernel.org, robin.clark@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, sean@poorly.run, akhilpo@oss.qualcomm.com,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, harshal.dev@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/15] drm/msm: Switch to generic PAS TZ APIs
Message-ID: <fuypqlwseulyvlsgiq3dnh3kwhernjid2yqljiwmrxufzfuukq@mfy343uq5gs3>
References: <20260327131043.627120-1-sumit.garg@kernel.org>
 <20260327131043.627120-11-sumit.garg@kernel.org>
 <aeduRrAMOAW4f5TU@sumit-xelite>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeduRrAMOAW4f5TU@sumit-xelite>
X-Proofpoint-ORIG-GUID: IZLHA9Y18E59NyYsmlD6LcnHjEPgTM5i
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e929c1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=dgZ2eqGgcVFd7X0fNysA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: IZLHA9Y18E59NyYsmlD6LcnHjEPgTM5i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE5NCBTYWx0ZWRfX+PtX8KlcdoeL
 0MzcniDAX/FQqsoopFf/oukcgBYkx9VtZErs26qbtVbefBJ6Ok4p2DmpCT5Cen9L0PQ/VY+mcl7
 xy23x97hZPl/jvHR2mvd9SM6G4ciVDUXbRaSnWzPMICDNW81urGDrscpdNYOQtibTWNNXs/WSLd
 miRVcIJqoRFAmwnzp5QBidpbEC7jhysRDkrp/ocltQzzPzg0e0wZ0nXVTn69dYM9hidqsCb7zfS
 tAlMtwlCMkS19kwbkkbdBDfDu9dt4DyzHDV1WtsQFVLbDWPF3BZuLgaUHFLExgiweGsgUpdU/4+
 nZyRlJmSlHqItE8qxf8pXlpi4ivuwsDjXLeY9jyprIZ5t/EsLTTs3ys9outd3JFJ2zlmMF1H34i
 VnACfaePk1LsYNl1kSBxJoQO/KwyzbIbPErY4fN+PgOL8sPOqd5v/uwcY17aFZtcXUjrftd63oy
 nbhOMTQzQbYGyGpaRqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220194

On Tue, Apr 21, 2026 at 06:02:06PM +0530, Sumit Garg wrote:
> Hey Rob, Dmitry,
> 
> On Fri, Mar 27, 2026 at 06:40:38PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > 
> > Switch drm/msm client drivers over to generic PAS TZ APIs. Generic PAS
> > TZ service allows to support multiple TZ implementation backends like QTEE
> > based SCM PAS service, OP-TEE based PAS service and any further future TZ
> > backend service.
> > 
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/Kconfig             |  1 +
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++--
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++-----
> >  3 files changed, 9 insertions(+), 7 deletions(-)
> > 
> 
> Can I get an ack from you on this change? I expect this complete
> patch-set to land via Qcom SoC tree.
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
