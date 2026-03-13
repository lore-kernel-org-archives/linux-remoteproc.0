Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983F3CBE9A
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422450; cv=none; b=DwiZb7upFk5VGL4BJOtNqd9MmYCdupCOGozSThHNvw7erduCZu3Tu/MxwfwcuJHiqhROwKrUTwMASrGh5K2JDjZ0wYLMVs6QNtbGUyZWGb84fmsmWtcMgg6myqwDOxUJPA9zHqHCNqG+Lvequhzj2WsFgizCr4FZNyTs63QgriQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422450; c=relaxed/simple;
	bh=D4TMMmmTFOOKh5r/I379J2oZ1r54N5E5okpEDVmLmSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SwynSMJsuRP8W7c2cxiVOXFhpHBE5hg8CxD46xDu0W2TCPaFZhSZR6zCrxTQktPrmfymvZU0goa4hUUN8umkg5XW2RmLXO4ytMqoOBxDrVjxp98HnUgc+9pBLg5ZOGxlZTZh3MsbfRensaGHTu8ndvgfZ60A/jsYWWmV9JP4sy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9qoLK+G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ANFXl5vc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9qoLK+G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ANFXl5vc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DEeUOf2262552
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 17:20:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pq2eKLqqkSS0N1cDySQHlqRn
	woOKv4S8kOtOzs0RTbU=; b=L9qoLK+GqQkmY9/AGoOtiyhR/65YmjRWqpCEi6Mn
	W2pFJO/D7UqDAb4qOHu4DVrt2MLFpSvnpNgN1NWdx35E+nXmjB06AfcEtAJ7pveK
	iomu1+JZlXzy6roU7jAlailZKya2ME4IKMlkd2m9x/NWNKU1e+i0PIzZsgsoDZye
	LxtARwjLnIpl6ImM4MBOSN5s9ERs52db5/32VS6nHcyHquPs2iyWTtXPRjq3lnrZ
	xI/wkW03hz7TwallTvNPFobfwPMFXedEyAQgAxGkVBhNeliYi/RBcVqr9cecTR9V
	Da/N3HqaDwzF8x1ZUwMOdJ6Bd8mFZe9xCxYc7NH6k/chog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvef4sycv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 17:20:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7a25c5a9so1293333985a.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 10:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773422447; x=1774027247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pq2eKLqqkSS0N1cDySQHlqRnwoOKv4S8kOtOzs0RTbU=;
        b=ANFXl5vc8S2zoEVBa22L7uBuYlg5uGJw58WccaegTkUM98DE2c8/3ekdPZ5lPYpi1i
         OqyOStRhv1t6yjCd7knKZahahoeL75KnH1FwJbfIKpHyqzmQccpS7NJGu+5f+/fF2L0O
         8oXgxZdi4JsTOhd63F9K3RRE63EZ1E1OXZA++YLUwbDLC62bDJ24YVZ17M/0mVvpdx46
         O8jn4s8/2gnruPoRP8Vq7HJCGNOacdSnIuGVis67OXazLTIj04aBlC0jCd5v/DNXP0nZ
         H0oMAhzsZo0omWtMlkPWzJ2esG53ZtVGHYaIWcgjoAG+59RFKoQmUlbcbfraVvfC+pL8
         g+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773422447; x=1774027247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pq2eKLqqkSS0N1cDySQHlqRnwoOKv4S8kOtOzs0RTbU=;
        b=QqkvcmGB6oDtSkAsU6y3P2ukRMvi/ynyRfkj2mUBvalZRhyzuanDtF3V4IwlVWthvr
         AFWAIOP84j5gewulFBlQvKWPpqhVTtiTk4GW9aDtKzFf1m6nkUkdQ+J719m0zILV3IBB
         w1P45BgRE626HJOB/LfMf0NRp2w1PSrj3o+gu0muIsBxdq60JLnQMnpslY0CFEJkbnVd
         g92tL3bz+pAWfWWjC6vVBvafDxukQ3CZh5H0guKiPDVSqIF9bzNID4+c5S1+gOX1upeO
         p0Y99J7chtH3cHeJXsi3AFGhOqVTj9XmfYOm9J7Si4q8lEjlHyayjxYmy8Y5yDb/4QL1
         jT2A==
X-Forwarded-Encrypted: i=1; AJvYcCVOvTTDF6hoWG/uPf1eO3UIdw8xBSq/QM3pEN9qLqPmW9G+X+ZWrpfXqWs9+rtVskGiSeycdj/qiZAyvpX/2MEH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9SLVX5eEigYq5S15Q3rn2OCwaV+z7CRtX2IY/atR+A7zy7FEE
	NtYZF8kybdqHo2FW0DP05ikESpCuWy4n4kYdnb7w+g0YVhyzHo8WEc8F5hb3HnB8KEotHmTT1Hw
	I2BXFu6Tf0tC356Fe3x4PQ+TkL+cChRXsy1L5sLhoCK+ICLREIxlTTTl8+3JV7a2EdW2tlRxf
X-Gm-Gg: ATEYQzw/0UBlIKvG+PDIUxC2kp9a7oXO3yZ6TeylRMD6UkLP70L9uvWGFuCQUtjlnUp
	5CkVRGVdPfvFsIh+StDSJl+fCfifBbENdlyoMuFoDOKUvvr0pG2YtD2UAX1uHFW5xlat1z9dxrp
	DoEihavXjhTdP0O9EeoV5zi4vLEMtkYyiHNx5JLKwheo0n5znZMSt1IHZ+CCEh8q7uDFc5o+i31
	BlTnCHBr8mFYgH+K+W+NxWPUkNaqYf16ebNrlPBx6oR+KSpB2qh9Wq2t5a9EtNq3Zphh9NKyls5
	4Y08FtZvzmO3xQyoX2J/8uO2KBILQc8zb+D1phnUFabc2p59hagb1bUN89skEdeqxY6jiakWD13
	JniyxlbqCyjVb3YMxD5Kl/kJgVjTkGFNoi8Q+utgg5Csb/KjXwcp2zsSwT/GGnj6BxtKfqpWboc
	pF94XcRARAXSkJKWHfoF+whjt0bxISQodyoeU=
X-Received: by 2002:a05:620a:40d3:b0:8cd:96e5:f7ca with SMTP id af79cd13be357-8cdb5b1ae9dmr555025585a.51.1773422447250;
        Fri, 13 Mar 2026 10:20:47 -0700 (PDT)
X-Received: by 2002:a05:620a:40d3:b0:8cd:96e5:f7ca with SMTP id af79cd13be357-8cdb5b1ae9dmr555021585a.51.1773422446687;
        Fri, 13 Mar 2026 10:20:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162ba3sm1653685e87.47.2026.03.13.10.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 10:20:45 -0700 (PDT)
Date: Fri, 13 Mar 2026 19:20:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Map/unmap subsystem region
 before auth_and_reset
Message-ID: <3o4qzyy46wyw3rxxx72t5uy6ww37vtbbywmaig2zplmsklevbi@k3n5jalqjqqp>
References: <20260310135205.2497789-1-mukesh.ojha@oss.qualcomm.com>
 <20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com>
 <uwqpxa4jqf3k3pbcf7mkszzuhrqulich4iujiejtuey4vrtg5d@umlik2vhdkvi>
 <20260311084918.q4vonsudasta7dll@hu-mojha-hyd.qualcomm.com>
 <55oglwp3ejolkjyksn4am2dnx43k7axf5zl6tevkuuuww3n33u@jcffxhtaxxaq>
 <20260313055718.yyb5ohjdql6resdv@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313055718.yyb5ohjdql6resdv@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: 6BSWhZqFxKcxRY_ebJ2kls1YcNCCLh2i
X-Proofpoint-GUID: 6BSWhZqFxKcxRY_ebJ2kls1YcNCCLh2i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEzOCBTYWx0ZWRfXyg4kgxza3UpI
 MB2PPuh+vvD+UU1B6StIcp0WgHWvmYNOR+TokHdwqdG5N226ZwmWon5E7gr47VsmdOdZIVKj25C
 brtQ0S5GybMqAXZgN6dEs+YN8fr5gu11aOOcYlgZFXJkqytHxmc/I2I7YssIaecMuFmWvWTKRPk
 gnJCxvMiAXbsaAnl/xTlaTUNWfajBhN7juN4KqH18wLZW1FfQU4ZDJ+ZPav31X+0BRbIbFYGrWZ
 iMZlR8jRk6AdpedIfDwBmcKtCka8W2LYsby0cYEWmAz9jU2JKb9Pimo+F4cVzPx/GLTrq7kkovR
 C8uo4ei2JRLmb3o3TIlEs7OA1tz7z23XyeoFhNLHWz62lx/LWH/2L4jvVqDcqsVDDU9uOxRrGXg
 stCaxdPpiEvLtSQIGNqaidymdqzDWE4QWNxvX5/N/3EwdzRDR0OJi+5BtbjOGT+RTowiky7cu7f
 AwUdDPwABkG6KoNf/iw==
X-Authority-Analysis: v=2.4 cv=S9nUAYsP c=1 sm=1 tr=0 ts=69b44770 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=k1DDLxQpEMSJglwgNqIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130138

On Fri, Mar 13, 2026 at 11:27:18AM +0530, Mukesh Ojha wrote:
> On Fri, Mar 13, 2026 at 05:40:22AM +0200, Dmitry Baryshkov wrote:
> > On Wed, Mar 11, 2026 at 02:19:18PM +0530, Mukesh Ojha wrote:
> > > On Wed, Mar 11, 2026 at 04:34:53AM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Mar 10, 2026 at 07:22:05PM +0530, Mukesh Ojha wrote:
> > > > > Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
> > > > > Peripheral Authentication Service (PAS), always map the MBA region before
> > > > > use and unmap it once the usage is complete. This behavior was introduced
> > > > > to avoid issues seen in the past where speculative accesses from the
> > > > > application processor to the MBA region after it was assigned to the remote
> > > > > Q6 led to an XPU violation. The issue was mitigated by unmapping the region
> > > > > before handing control to the remote Q6.
> > > > > 
> > > > > Currently, most Qualcomm SoCs using the PAS driver run either with a
> > > > > standalone QHEE or the Gunyah hypervisor. In these environments, the
> > > > > hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
> > > > > Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
> > > > > reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
> > > > > violations cannot occur.
> > > > > 
> > > > > However, when the same SoC runs Linux at EL2, Linux itself must perform the
> > > > > unmapping to avoid such issues. It is still correct to apply this mapping/
> > > > > unmapping sequence even for SoCs that run under Gunyah, so this behavior
> > > > > should not be conditional.
> > > > > 
> > > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > > ---
> > > > >  drivers/remoteproc/qcom_q6v5_pas.c | 48 +++++++++++++++++++++++-------
> > > > >  1 file changed, 38 insertions(+), 10 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > index 3bde37ac510c..033d618ccba9 100644
> > > > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > > > @@ -138,6 +138,13 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> > > > >  		return;
> > > > >  	}
> > > > >  
> > > > > +	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
> > > > 
> > > > Which will be called once per segment. Move this to qcom_pas_minidump()
> > > > and call iounmap() afterwards.
> > > 
> > > Good eyes!, Ah!! my bad.
> > > 
> > > And moving it to qcom_pas_minidump() will cover minidump cases and
> > > fallback cases to full dumps if minidump_id is mentioned for a
> > > subsystem. However, we may miss mapping for pure rproc_coredump() case
> > > when the framework assigned .coredump = rproc_coredump when vendor
> > > coredump callback is not provided when subsystem does not have minidump_id
> > > mentioned. Do you think writing qcom_pas_coredump() wrapper over
> > > rproc_coredump() will be fine ?
> > > 
> > > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > > @@ -141,6 +141,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
> > >         memcpy_fromio(dest, pas->mem_region + total_offset, size);
> > >  }
> > > 
> > > +static void qcom_pas_coredump(struct rproc *rproc)
> > > +{
> > > +       rproc_coredump(rproc);
> > 
> > It won't be that simple, most likely. You'd need to call ioremap_wc()
> > before and iounmap() afterwards. Then it would make sense.
> 
> I meant the same with the help of wrapper..
> 
> > 
> > And alternative option would be to use
> > rproc_coredump_add_custom_segment() and add a custom function which
> > would perform ioremap() / memcpy() / iounmap().
> 
> This will involve map, unmap called for each segment.
> However, I feel, it will be inefficient compared to qcom_pas_coredump()
> where, we can map only once.

So, let's have the wrapper.

> 
> Thanks,
> Mukesh
> 
> > 
> > > +}
> > > +
> > >  static void qcom_pas_minidump(struct rproc *rproc)
> > >  {
> > >         struct qcom_pas *pas = rproc->priv;
> > 
> > -- 
> > With best wishes
> > Dmitry
> 
> -- 
> -Mukesh Ojha

-- 
With best wishes
Dmitry
