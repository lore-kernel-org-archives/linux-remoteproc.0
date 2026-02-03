Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898EF32E690
	for <linux-remoteproc@vger.kernel.org>; Tue,  3 Feb 2026 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122403; cv=none; b=K11iDa3naRqF1U+iigLAgETCE6RG7ZppSNsVdVn4JqYlJrP0C3FFwrtQODb6e07SbMHbUH1S4FfTQEz4PtOpt0N2F5zaKBk05nP5pWa1VS5kqbAHZRzsKDVWIroHLju+AiaAb5jO4TwjjfaZdSe/DFHlKdXraw9g5biK4EF+cdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122403; c=relaxed/simple;
	bh=83yjvih4j4UOictC6ahgoIhRDOa2P/J0oz7lHYxnhb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJVqO/doaIUAhwP9ATOxovhQ4wKh7KsK1YG8wNviM8VNKM3K3LlOx2YSHl6/vOxWQaBJ908/FFoSom7oaZx85ldXh/QytTjRQzGiawcNLK2WPaZfNH5SqlC8LIErjxxZqfu9WhWR4gzkoovyOesGfNni/mmEK/ziNBY3sPnij7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8UYK0aH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/55p1Rv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8UYK0aH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/55p1Rv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613A49fe915698
	for <linux-remoteproc@vger.kernel.org>; Tue, 3 Feb 2026 12:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ufTr7+wzZ2/b+1pjL/6eFzV9
	KL+yNiviwWGyOeRQjGU=; b=M8UYK0aHetEUsxaG2LKBeqrC86ZIxw86xY0exxR1
	MmQSCmtaJnsc2+0l7c9AqteOJkcg5TTdN0TuKWZCWn1h+9a3zazZ01IPJQ3y8W/a
	mhiK4XEYLr61lGwCE+ML+OOwHGN/cpVKOovI8VQneXxeOlGerMvq6iiKyF1LOOZG
	MZO+KrgK0guLWIboSrECV3GDPLdhToXpe0vLb3zCnXsyv88BIbaysXmqm8VH1ILt
	Lg76EyAKw0Czm9ROfXSd5m4yc103QuFS5vDKSZ98E6MLAyxwZ7M2KBUe01YSCTVk
	ia8jcQ7PuX52Tw9EEInwOhv8i0Lm5j5L6wwXeZTe2u8AhA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exk8efv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 12:40:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a87029b6so1668125785a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 03 Feb 2026 04:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770122401; x=1770727201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufTr7+wzZ2/b+1pjL/6eFzV9KL+yNiviwWGyOeRQjGU=;
        b=d/55p1Rvruo4yRuPE80pHxcEXSLWiLsll/8QxBxReSOXHFsJAHj8R7t/CxlopnO0zf
         AVZbsZgh6AEQZsHjUe/TOI7GcocrJwn7UevGO10jJxKKGwQc9dGokEsTXZQVOcGE9jYZ
         ljwUy/g4y/puR+3dwvUJmETsTori6QEkMX/6uFgrs4pXztFYo6IX5rcjXoJe7PZy/b7i
         X5kbl3ycj5vPOeAJ5Q0JmHta66uAtdP53Y6YmZ0fTbynurHFczBFzzZVf5NhIswMxhTh
         1anxNJ82PWuLXx6fsKxh6mXaR5CDmZEKR2MC0VbX+PHkdO6CUIGriixJDb0pRpwiLfg+
         ztVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122401; x=1770727201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufTr7+wzZ2/b+1pjL/6eFzV9KL+yNiviwWGyOeRQjGU=;
        b=CPE8gjEbUuduDc9+Yfpx1h+0o/3pBOqPjYUy3H7A1GJPIA0UkrqBKOb0eU+ucFbKTD
         8+BMzdSJRhJaM065r5x69hVLIDDZ+ycYkrnT4dw3neO/GrLc5gFmxd+4LglTlruqmeuJ
         EGru4agr5f6BYDMuV+HBNOIFG16R7wu5w8a8Clc92CcxwgPvnDcWLgEhVaqkJ51EYtzk
         YzrRBkhBl8RGzcm0I++Y/HjYf6C6QSrKGstxDeONjC+Qr1ldIQ53ic72eWk+e+V1/wyP
         4qaIM6x7fMr+IJdG1uLj1xkwLlmnTe2ETM0qj88Ug8zf5OvFirb+jDcE+/7nuAah+NU9
         Cu2g==
X-Forwarded-Encrypted: i=1; AJvYcCXCEus6ITvFDpQ2cG3me8tUKi/VZllwBb9bnfNPNxCeT/tqqUs3neyvlwF4whTK/d6ajipbPhiWdAsoakfGzK6B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0/stUg40K8xqAb1Z4G+KrkbarQjuKjumad1TfdJQbFKvx6y4
	tC/sj6jHMrsGygLadxgiqbd4XS8oZoJOQVneOqNAZcIMt4Jcw5Pkc8la3HG06u670T+z4Lxh5SY
	Glxz/17GYFXQXivgtqMDVYv4pk7kN8Sg0mqOLuW8ZypMPI1hW9gT278MUjg1kYzU0mZxmUDFn
X-Gm-Gg: AZuq6aKFl/ck0i2UkX4KocG5XGsBjbAuzZFxx58alDUzwbM/snTyd1eWTFFTeMe0HGd
	kEYyJNHJCU0B+Eb4tkhnEW8LimEwviNab8qY4JF6Pp0bWXS+EcQYDUw0ihyL4HBiyEh5s6P2P8P
	z387dm7yC0lw2Pg8KvidaorisDw/QwtzAKKR7ocv5XTulHjP5mS9SzWmoA5XGbEXYLLdq6AT9sz
	Zfun0tO9nGL2ZSiux2fbuI2wWBqnBFBx6uOJflI43ybVxZEzTpNFWZ6dL7vADbLkTRGO1cZ+ydL
	ZA/fyKydda1iCttbUUeNgeQ1MVPkXT4JWZXuIk1amcAGYDOz1YBn4Rq0239nQr7R/MKOEe8aNwg
	fAWIrz1vfsx3raZs6J9xezCbfCjcpK0lWYrqGYuuzWWLHXgGVKUl3ioZsPna0FD0pxtIPPOel3+
	dyR67ZTUwk9S/g7/hKqIy2LNk=
X-Received: by 2002:a05:620a:2906:b0:8c6:a8f8:9645 with SMTP id af79cd13be357-8c9eb37278bmr2010936285a.90.1770122400886;
        Tue, 03 Feb 2026 04:40:00 -0800 (PST)
X-Received: by 2002:a05:620a:2906:b0:8c6:a8f8:9645 with SMTP id af79cd13be357-8c9eb37278bmr2010930385a.90.1770122400389;
        Tue, 03 Feb 2026 04:40:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bc9b0sm4187258e87.91.2026.02.03.04.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:39:59 -0800 (PST)
Date: Tue, 3 Feb 2026 14:39:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, robh@kernel.org,
        srini@kernel.org, amahesh@qti.qualcomm.com, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V3 5/5] arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP
Message-ID: <yaunylao3nefmhbdovpfoymy63hjfjtvbwm5quqvdyk3enpno6@7rmpnx7esdhs>
References: <20260129001358.770053-1-sibi.sankar@oss.qualcomm.com>
 <20260129001358.770053-6-sibi.sankar@oss.qualcomm.com>
 <e658b473-6f05-4f83-a730-e586068d8742@oss.qualcomm.com>
 <sgomjvhwnnbvuskxqfybczvxtwn2lourr5eq4mw4qyxp5s6kzc@ccgx4wn5wqi3>
 <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24973bc9-a082-42ec-89f4-12758ddca136@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMCBTYWx0ZWRfX5m9I69T5Aum9
 e+Me8T7AeB8EaAg3WbRsqGcyWpqrOACiXS5ERx27X0zmeC4Rc1xvMHpNrxmM0+SeXpN6ZkHveJ8
 mB0cXUaLaPOUSktVwYSpCX/v/1AHpfgk/bUMU32ZD3aNjHsuAEVPnXUFQPhzUn+YdrOTs8vlE8F
 5axyUjIYq1xV6sD7aw/stA/fw8Qx+l9848ei1gwmDpLc98yy1qwEt3IR1ju4enlDUr5+Z3dOFAo
 KiiZHJbMDug5a3xD+PLZ9gpb0BYhrdpXIxL+e7mg6Mj139FnV8xBZQjbSa9ph/v9bnI73ywKY3g
 0m+8ywVBI3lAwZ9tq5gSHqRryudvvZr7hvWt9YCSBM0ctrawqsPUj+qJqPyl6Jq210jj1X/91t9
 4WC6mtPIaGEWg1/ux/49V2lMiytHWEsRvWUCAGeRoaFH0xJjApU8jUTa4g1UxSOTR4V/cKKgJTh
 3nVgTUUrEyCIAz4zM6Q==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=6981eca1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fMO12ABWoyO7-lQLxlUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: E8CqaC09aLdej4R8Xgt0c8Al27XgJSMZ
X-Proofpoint-GUID: E8CqaC09aLdej4R8Xgt0c8Al27XgJSMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030100

On Mon, Feb 02, 2026 at 11:16:19AM +0100, Konrad Dybcio wrote:
> On 1/31/26 8:54 AM, Dmitry Baryshkov wrote:
> > On Fri, Jan 30, 2026 at 10:55:24AM +0100, Konrad Dybcio wrote:
> >> On 1/29/26 1:13 AM, Sibi Sankar wrote:
> >>> Enable ADSP and CDSP on Glymur CRD board.
> >>>
> >>> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/glymur-crd.dts | 14 ++++++++++++++
> >>>  1 file changed, 14 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> index 0899214465ac..0eed4faa8b07 100644
> >>> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
> >>> @@ -487,6 +487,20 @@ &pon_resin {
> >>>  	status = "okay";
> >>>  };
> >>>  
> >>> +&remoteproc_adsp {
> >>> +	firmware-name = "qcom/glymur/adsp.mbn",
> >>> +			"qcom/glymur/adsp_dtb.mbn";
> >>> +
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&remoteproc_cdsp {
> >>> +	firmware-name = "qcom/glymur/cdsp.mbn",
> >>> +			"qcom/glymur/cdsp_dtb.mbn";
> >>> +
> >>> +	status = "okay";
> >>> +};
> >>
> >> Please make sure it gets to L-F (only Kaanapali is there right now)
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > 
> > Hmm, looking at x1e80100-crd which references qcom/x1e80100/adsp.mbn,
> > but the firmware in linux-firmware is (now) targeting IoT devices,
> > should we use WoA-like names for firmware on Glymur CRD instead
> > (qcadsp-something.mbn). It would match what was done for the SC8280XP
> > CRD.
> 
> I think it's simply time to stop pretending the firmware is generic
> (some fw simply isn't and some fw may come from different/incompatible
> branchpoints) and include a board name in the path

Well... CDSP is usually generic, except for WP vs non-WP.

-- 
With best wishes
Dmitry
