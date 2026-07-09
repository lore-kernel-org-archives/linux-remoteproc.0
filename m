Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1F3421898
	for <linux-remoteproc@vger.kernel.org>; Thu,  9 Jul 2026 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598487; cv=none; b=A81JbgE788Li7YJ8CEYR8MSdETkSJ+80eKWaWeBH1AySsX4u+8a6g+Mx8YDPPujNZgy9lzToX9sbyyMPP68+FGIJF+XuJcTai8Efj6WTIrhdODc9Qe6mjHr5UrAHeOfCs/A+Z0n/BJShLRNh3RK2qCPgeJ1NLRckZ6iuWGb/veA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598487; c=relaxed/simple;
	bh=dSRokIMG5FGCZ4G+yYBu/oIlzG/8dd+9MeEg+3C5DBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lr9mey6bIq47UdpTxiireWWQ755z1992G8JZUZRjyFGwu6haxDHPZp0Db/mY2ikAZ6Va8WDzEMYnyi0sz61MOf74Ry3m2+UGUSwnuZURUaoUKPlmVBgd11MpucHq65NshuMcrsPQE8aZmr2ZON+LpyvpJ1p0mhhJ/ebQFjzYGm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dk0OYiTT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LbH6dWt9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dk0OYiTT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LbH6dWt9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNMiO1626120
	for <linux-remoteproc@vger.kernel.org>; Thu, 9 Jul 2026 12:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lSRAHUem76Xncoxq5BufxBYy
	3+SviaRcXkZ1QjWiysc=; b=Dk0OYiTTBBpY3gWGfrqEtNt4Xc3PNPcfwugHEUjy
	klD/ypb045J/c1uZs9YUjlVDNfGidVnOs0OQ8oRmRlXcijHfopZ1qSfOyaff2/VM
	WbnrnX+DRZnBb6NdGJxZr4bZ2E/TwKbe5Ma0Od6mCpILXnwEKpa60rarUBEfn9rw
	YGtKrGxujBfFVXLxbSkZtxj1OU45GQv7wrXNUNFexxBC9Dgt7gK7uCbse3W3F0vx
	qzJdRfQi7kIkHK72+CRp56wYgYhxvNfzD9AzyR245mZKEigjLplcGpWp+bOJE5D+
	SkpBw9LOtY/mNQu5JrR63Ey2WIApy2oo46+BO0EuRYVwzw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq34e78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 12:01:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-380fe2a3fc7so1918075a91.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 09 Jul 2026 05:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783598484; x=1784203284; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lSRAHUem76Xncoxq5BufxBYy3+SviaRcXkZ1QjWiysc=;
        b=LbH6dWt9+wlR3Acrk02BfqbHdM4yM6OBSZV1AzNPMFjcVKPDxpPwU2BSu1hozsjd0X
         VVGEmuy0RA4sFk2Bccie/+Oe1nOyBbHKZC0s9WreDa3/CCNTArnPSLRlZ3ESUxylAj5i
         WEIV0rA+hmHSALvdypNHts5XmcKsLlRvx63LN7vEHn6Ahq9627Q5HezVRWgfVoa6oKVR
         9WyIp87tgDR+Ydr7kIM2m/HvxgOo3+ZmtKDbFyX4k1Ug6hU+BEkpNQRcurD+RERj/zIr
         2QntrZElHAtWE2VcY+b1Gajd9SKMUC/YRTA8M4kN3CHODGvDG6QDvxNNoGvTJS2Kof/a
         OVMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783598484; x=1784203284;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSRAHUem76Xncoxq5BufxBYy3+SviaRcXkZ1QjWiysc=;
        b=DNdJOswRojGX7JvyRZecoKkXnMwKW0iqOZkDGLD2vW8KSWp1tF3XZPphFlqc6/1bdk
         1/kJ97iogrUsti43HbUqKk7ZOyUVhR948Fng0dFh7nZTGtale/zVNa+4zXZDEat10iqT
         OO4AejgLzB68zUikPE2W72ntLLQ97+SphJxPvB8bFgd7ALNVwF9YMnM6g3KEe7poho/q
         GQjdgjb62CjrWH/cHSUb1c6pvrrnV4OzYLSnrOlbsldB8KYoTMoVPW7X8drecM4y6jf1
         hKZjMPmDYhvgibB4jHbMiudZW1v/HHce3GVNQvq5Z95w+T2QyGRzk+iwneXcNdnlKHsP
         ECkg==
X-Forwarded-Encrypted: i=1; AHgh+Ro18McZT+GfAZevGTHMdnn1tSeVjs2JOVqGDK+gHJCcvlMASfx6nDA50jxjlGahk4+qcxNTTGDqvkOuuYGcsOLJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyqdhNBK3QCzwwl9JphlG2tBt8buUBhyLGofEmb1oFoOfwo6/KO
	ZNsKz8kPhQgH3VaUDr+RfmePuH3PhFk8tu8RyXh4Tk2vf1jMqKHoEk6yAAoPqmgjsDTI5B5KxUk
	RRludyj7BTeTm/pViHK3vvD6iq0SHa6uYLqxZAUbHZGLz+LfViJC7j47xI3JhXjZ1WW7pyQzq
X-Gm-Gg: AfdE7cmDRMQJV4lvkKFIKXaZt5GFoyCNBGgf3Ga6zsMk9oosET14LbMR6Ec0k/855KW
	dkjLTW0D6VxIdiAeU1ABJpgqclbetSANUwGWh6Uxg5k86oyW7YtaYurGKMqw5bt7DnhcYmCa+LU
	JCM5V+TaEVElFfkMc0v/rhD/EhVthpGF4MzC8lBCon+9dqMCbnT/XKqta+3e2WdaJsrjzaxVg9F
	wypVWyge/I4Xb8SJrdinI8+CospBF4jiS9zuvC6kDayxGcafN6tBqZpi64ooG2NSFkD9VZ9F8/i
	D5bhmeuZNV7t+HTxYXE6sEkNib/3JyKbg0UH8EbEAMUZONU1An7fnNi3HdaW/KPZVhlFi5poHR1
	TsY+6kUE4y7VxuvrfCRlrKerx++DggvdeZSIGLTJ/LpUjC39Cm+9jiooCzQQw
X-Received: by 2002:a17:90b:4cce:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-389421ac479mr7391613a91.29.1783598483677;
        Thu, 09 Jul 2026 05:01:23 -0700 (PDT)
X-Received: by 2002:a17:90b:4cce:b0:37f:9ce0:af32 with SMTP id 98e67ed59e1d1-389421ac479mr7391549a91.29.1783598483101;
        Thu, 09 Jul 2026 05:01:23 -0700 (PDT)
Received: from hu-anancv-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm34921181eec.19.2026.07.09.05.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:01:22 -0700 (PDT)
Date: Thu, 9 Jul 2026 05:01:20 -0700
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: fix SoCCP memory mappings for
 Glymur
Message-ID: <ak-NkIoAuiZ_8q9u@hu-anancv-lv.qualcomm.com>
References: <20260707-glymur-soccp-v5-0-053993f0c6fe@oss.qualcomm.com>
 <20260707-glymur-soccp-v5-2-053993f0c6fe@oss.qualcomm.com>
 <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709071407.hd2etfpud5dq44yd@hu-mojha-hyd.qualcomm.com>
X-Proofpoint-ORIG-GUID: I8dreEb8TpgJJEcQzJGF6pmGh3OIpxwJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX+esfcCMWUTPT
 hXLDnCmVpZGfOZueWF/rPVJdYNmnFAzjOX7tws5jOQmtI8EQ7xoXuqZhteyBL5J22/UUyr1YCOz
 RFHIkpcsxO6BJIzic8cwKeeZozcexf8KRi5V3NuQwdYO4okbIVcOQMYUh6t8HuiV6GpUjXWD2iM
 r+cDySniWENn75SSLCtVOlFZgRR7cJ0KHkZg3dHBAkBaJNtitaHcjagD5bMThpOVSqx22+oN5+l
 RKYPCsOAq2Ipu9NKs4Wj8IegbzKNMXlK6oBdMcTnwvivNY+IOAFQ9NHo+xKHcOZ1bLeIehbbJ7s
 l1io7vKmsTjjZ8R4zvTAK8XfJ9gk3mWIQ7f4Yzi1KXx5VSWYkqayqmev1eIqEQHNLKSBEN57JPJ
 /haO6IfITv9VtYOdOVsdXR+cI4kfJ3Jnf3UZdE8IHc4FO8ThPC1P7flPRZxlnneSRxzh2HfHZzu
 cjsTy2FhAzmC/vIwNFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDExNSBTYWx0ZWRfX3nNga08sGnlU
 HIXA+2l9BPWymNz4OnZMiituC+bGNaHgDp57pJUrlNnjy2HM5yJC1ALiNCbKjY6DIPb6qXqD+JF
 7nIwRFHQR2ajFxocdxhQb9WxOrU5ke8=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f8d94 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9Iu-izY7Zm1IiM7mkRwA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: I8dreEb8TpgJJEcQzJGF6pmGh3OIpxwJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090115

Hi Mukesh,

On Thu, Jul 09, 2026 at 12:44:07PM +0530, Mukesh Ojha wrote:
> On Tue, Jul 07, 2026 at 03:12:45AM -0700, Ananthu C V wrote:
> > The currently listed SoCCP and SoCCP DTB reserved memory regions
> > don't align with the memory requested by the SoCCP Firmware. Fix
> > this by updating the SoCCP/SoCCP DTB memory regions to reflect the
> > memory region requirements of the SoCCP firmware, as described in
> > the Glymur v21 memory map release.
> > 
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> 
> 
> It should have fixes tag ?

I did consider this, but since neither reserved regions had uesrs, I
thought this might not be applicable.

> > ---
> >  arch/arm64/boot/dts/qcom/glymur.dtsi | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > index 20b49af7298e..9ec7c256b80a 100644
> > --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> > @@ -602,13 +602,13 @@ spss_region_mem: spss@88a00000 {
> >  			no-map;
> >  		};
> >  
> > -		soccpdtb_mem: soccpdtb@892e0000 {
> > -			reg = <0x0 0x892e0000 0x0 0x20000>;
> > +		soccp_mem: soccp@88e00000 {
> > +			reg = <0x0 0x88e00000 0x0 0x400000>;
> >  			no-map;
> >  		};
> >  
> > -		soccp_mem: soccp@89300000 {
> > -			reg = <0x0 0x89300000 0x0 0x400000>;
> > +		soccpdtb_mem: soccpdtb@89200000 {
> > +			reg = <0x0 0x89200000 0x0 0x20000>;
> >  			no-map;
> >  		};
> >  
> > 
> > -- 
> > 2.43.0
> > 
> 
> -- 
> -Mukesh Ojha

Best,
Ananthu
