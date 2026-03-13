Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6233134FF5A
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 03:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773373231; cv=none; b=As8gBotQutnoi6sL1d8Aqs0W39d4Mss8fg6e9Bp4idFAbzT2PwVQ8tTWLyg3XvVQx7tkHy3q9tXMGfGn57mpI07XgRVPImS93jE4TnS2X61rkk5HaEPxZszRfRJsnm4TlClUwGKmy7Nl0v3c+rdzqjKQWRd/gI2t84CTsc+kT4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773373231; c=relaxed/simple;
	bh=ltfiDfE5g5QX5g0lY3vlmncGCmA0gES71uxsyvPSnYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dADQa+aXJMSNGKXwI9xTnlvglRX5eygGekzXpxiWLyXDr/EAeDavQXgOubj9yswuu+7ev7wwKg9YepgXQrDym3ClnEN6NyD1skcXkZhnYaw3UID2APRFMyBcwqGUWHMQJnyPb/qbjy/tzmKue20d4a8msX1w9+3Rn6eOkbfnejo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcDW0IOX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RLboecII; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcDW0IOX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RLboecII"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CJTwfk263530
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 03:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=soEEFrnJQV4WHOjC4LmqXnEi
	VPaJ6DsC6HzsKtXirtE=; b=OcDW0IOX8DiRuMOWbMLiaqj2cc2fPYtrLgoalHmr
	VLs901+9+eD+dSKPSHWjKB1RuCmPLrstfkzpqOfoARO5MxIpNp0sFpqkXKN0XJf8
	wlzm/9djEt+8K9eB5VcZzP3yaV/Q9YHtFegqXVe2PiGFPIU7H/Zfz+nhLdIAfzpY
	LQdmtnTD5k+4w0Nv3mA+VokYxaMUldg4J/vpIwin0TguOPFqvWMYYCTQgYee5Blb
	bdmNpU/tn03y2FR5JnQgc1uDA2hQ34xmdR5p2UNvOwXBNw0TXQ90iKkkkjAdJlPF
	X34vB8maTZInbz9NbQlZyxIm4Ok+MWtj4JVC7H6qvgoFqA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4ymc7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 03:40:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7a25c5a9so968052685a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 20:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773373228; x=1773978028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=soEEFrnJQV4WHOjC4LmqXnEiVPaJ6DsC6HzsKtXirtE=;
        b=RLboecIIy3bbBziDSVLesmVNSq7LmqL7Uf0niQiRzcilay4grevdaj6wXhgMtTeba6
         xI7nCRcvg+19n+X9KCAMYYPpbsipbHDGpSB9VbLVDwIC6Vh2dqwwdFxGkjX6+pWFMlpU
         5AmQx3TK588yfsAbNs8VEpXRwaJu3VL2/VHprjX1R+02zbvwlwst69FNg63EGbelN3rr
         IMCQS1C1CVvIYk10Awvh/UA15EwmzJqVhoXztNOoNb9yWrHlCQbAGVnBZHfKl9FhMYls
         oIs+zgFMCJTkoG7sfM2JnZVaXhczlqznA8Bnjhb8kfHceF7XgDP6Q59aJXBxjXAeSHKB
         5Keg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773373228; x=1773978028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=soEEFrnJQV4WHOjC4LmqXnEiVPaJ6DsC6HzsKtXirtE=;
        b=NE6F9D6whWS1MN4GZxMSpDjG/BMSlYAXydT5r0TJkWoA245X7J2k75MNtfsvjC+tBT
         i3WXOvKE52oCZZUJtQytKOpPEyG5TWD6ssCcDVbVJJYuOvcSpU0Mdbl9yHJqrK5vxR7s
         Zer3PdtA3rFH5/lqTpYgYvCTioIBZI2Cq9zIaJlFa/KWUea8oa3mXsCAX1MGJav2qi8n
         FnCCfZNLz/4q5ObxnwSl9pgA6Z/crsTy11PRIFUbMJtWIViBvloCz1sa/VB8CDLSi42/
         Ip5rcKk7l8oUwtZX1iEggvdE6mE0bD/6pZD1MRe+bDoSsb1OuURbscRQwtKPp4ejrUmM
         aXwQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0w6wVCrsZcn1KF4CD8uhLIZausJQ0noFkwOOOpt83c2DyIco00WEkZtK6VG6mpcBQkI76DybwCRixuwp2j9DV@vger.kernel.org
X-Gm-Message-State: AOJu0YyAFoZroMaxiATzVYYYJ1aG43sA7yP5o6HyMq6GiyMAdCDpkGmM
	DN9ffciYU6989LU6zMcmaKPkNIunHsT4y/PymWAA8jUqSjozYw5H6YstaJw4ih7VQppHLdtFBJj
	iG9d/G1GChHe/LV6jjDAParJj/wGNS/mhENh+hTcjof+n2Qz+bJuPX9V0ZFuQs1aDvZctjUVeqz
	+qP9kw
X-Gm-Gg: ATEYQzwdtl0F4Q/S50hqbWmQCjqLe3bB9w64fHhoyavuTIJicgPrAIDyXO5GXVVpbhM
	FxrDPdQCplfaov1FMDnSO1b7qXJeIlPqGn47OT1xMA0ArjIFClkdWgIhHodaz4oR05AN54h1vjt
	Tez7c80Yc0KZw3eENT2l1Kp4FkIPROAnrmBQcaZwBwrz6UcuW4P67QIPgLmoWEV5CvzYdkDC3SL
	bA/4zGvxiit7BnmKeKaQnwPWPX2eC5nUgWa63b2uvvDOHc2NpAIzQ4kGFCByytC8SKiho89qeaL
	sXNo/1d/cUdUUQPHmEUSF+vouRAVBdFc6vnFPTruyMyxHsBIqsZp4wU1d4GR0QbQ/IZ4hBhN1ZP
	Vm5oZGajP/C03NYtwoWtfHJv9qMPvE/wo5YZRWWldi57dPL8T8bF/hIj11S+6XJeO7hesGWJEVA
	Ca2GZZ9jA5H88KYSqO5cS6hbmmn0zCT+XCoOs=
X-Received: by 2002:a05:620a:2802:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cdb5a8d001mr285941585a.35.1773373228206;
        Thu, 12 Mar 2026 20:40:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2802:b0:8c6:a034:9225 with SMTP id af79cd13be357-8cdb5a8d001mr285939985a.35.1773373227693;
        Thu, 12 Mar 2026 20:40:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162ab8sm1274609e87.51.2026.03.12.20.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 20:40:25 -0700 (PDT)
Date: Fri, 13 Mar 2026 05:40:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <55oglwp3ejolkjyksn4am2dnx43k7axf5zl6tevkuuuww3n33u@jcffxhtaxxaq>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
 <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
 <uwqpxa4jqf3k3pbcf7mkszzuhrqulich4iujiejtuey4vrtg5d@umlik2vhdkvi>
 <20260311084918.q4vonsudasta7dll@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311084918.q4vonsudasta7dll@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAyNiBTYWx0ZWRfX64weV3TnMh8x
 cZhnlG682g9akqBmZhgdOUdGgguetziHSngmVM5zZ9vp+uadgSQuXZM+5ajzjD6dWhIQxfiM1Fd
 afz3Ibl8dcPLor3ptL1q7OiYUmVnZnY9hFJrqae+ier6VitklOjxobrX0mICmCJiYHcqYxqM0t2
 rX6fL50rj/9uXa6tvXpJ43abYQJWTFu/b44zs3IybP6aVx/Hi2YPvepiN2HHpwE9UYKusal10uf
 rGXGlKhH5/0zHbIsmXamTLfMe8E9lOsTr/0ozty7KSt2X8c64e9+QWTynt4j5TawDqZpzEY5rwC
 +a2M8IRm0Zo/RMLO+DbSw4GSHw46gV4+9hJyW7NjKADx32inrqWXkV2wE7OenVgcdSqFOUjUc9Q
 uifLIPzRQbmndiRrNwnctjtLxdhuahRCphz4zIgDCFnApdkFUuva+U6+O4nykClSuI+arPsZj/n
 MRlhzwr8ySZ4MGmMQsA==
X-Proofpoint-ORIG-GUID: u-623KD2R8vZrl43sysR1mbSDhoJtblI
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b3872d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=3lGklYKCIXtHXvz2TNgA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: u-623KD2R8vZrl43sysR1mbSDhoJtblI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130026

On Wed, Mar 11, 2026 at 02:19:18PM +0530, Mukesh Ojha wrote:
> On Wed, Mar 11, 2026 at 04:34:53AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 10, 2026 at 07:22:05PM +0530, Mukesh Ojha wrote:
> > > Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> > > Peripheral Authentication Service (PAS), always map the MBA region before
> > > use and unmap it once the usage is complete. This behavior was introduced
> > > to avoid issues seen in the past where speculative accesses from the
> > > application processor to the MBA region after it was assigned to the remote
> > > Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> > > before handing control to the remote Q6.
> > > 
> > > Currently, most Qualcomm SoCs using the PAS driver run either with a
> > > standalone QHEE or the Gunyah hypervisor. In these environments, the
> > > hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> > > Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> > > reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> > > violations cannot occur.
> > > 
> > > However, when the same SoC runs Linux at EL2, Linux itself must perform the
> > > unmapping to avoid such issues. It is still correct to apply this mapping/
> > > unmapping sequence even for SoCs that run under Gunyah, so this behavior
> > > should not be conditional.
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > >  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
> > >  1 file changed, 38 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > index 3bde37ac510c..033d618ccba9 100644
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> > >  		return;
> > >  	}
> > >  
> > > +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> > 
> > Which will be called once per segment. Move this to qcom_pas_minidump()
> > and call iounmap() afterwards.
> 
> Good eyes!, Ah!! my bad.
> 
> And moving it to qcom_pas_minidump() will cover minidump cases and
> fallback cases to full dumps if minidump_id is mentioned for a
> subsystem. However, we may miss mapping for pure rproc_coredump() case
> when the framework assigned .coredump = rproc_coredump when vendor
> coredump callback is not provided when subsystem does not have minidump_id
> mentioned. Do you think writing qcom_pas_coredump() wrapper over
> rproc_coredump() will be fine ?
> 
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -141,6 +141,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
>         memcpy_fromio(dest, pas->mem_region + total_offset, size);
>  }
> 
> +static void qcom_pas_coredump(struct rproc *rproc)
> +{
> +       rproc_coredump(rproc);

It won't be that simple, most likely. You'd need to call ioremap_wc()
before and iounmap() afterwards. Then it would make sense.

And alternative option would be to use
rproc_coredump_add_custom_segment() and add a custom function which
would perform ioremap() / memcpy() / iounmap().

> +}
> +
>  static void qcom_pas_minidump(struct rproc *rproc)
>  {
>         struct qcom_pas *pas = rproc->priv;

-- 
With best wishes
Dmitry
