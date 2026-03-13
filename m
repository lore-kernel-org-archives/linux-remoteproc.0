Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76452D3ED2
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 01:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363623; cv=none; b=cf87otMxPO6SNr8e3kDpPuKZ79jz8RzhokbQ+AgWYfWnYvCuK5HEYBdy60t6ZxntjI9oKkp0DdKXewme3CsGdIrve8QlvcvedHlzuRj7fMfamKRl5jzi3k4ZkRbui7lcDSOmmhReUMWwfdLkWGyt24YC/m0KAnDq2ETXgqymMe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363623; c=relaxed/simple;
	bh=FXQfJcR+VBdT6Df4JpN0DbxF0y4BA+diX8kArJlf1/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZwXQIjS9ccQF7e+pzsVN8LqEmCbuySWsRc+DW3ZNG3dAyteV8V5YITZXKvJjeUorhft6MXItbQhREvR6jXw43alEIq+qXMlStcsjXGJh8ESA0z1WeZscVUfSHkYN3SE591RqUtMydbBS12oXRR2fwyOVJpXeNHgYahv1+mQEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j3ctPEEZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kh0nUhZ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j3ctPEEZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kh0nUhZ9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CMRsUr231948
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 01:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=umDVeTcpAWbzP3AnJt/b1Qw3
	MTgZdpp50Uw96KR4UKE=; b=j3ctPEEZ2FYcTTo7fqN8LwYXG9Mvg58KFTctyaFz
	goCDA7M80johF/r8lcYtiOrRrdo+SdLNSgdexUdhC1V89FoHsv778AL/CR2HFcgo
	S6ifn4F5uqJ8DBML8lhW/Qn6IPaZ60sJvLu8RCbpSDI+3fxfzueEfKsuUe/iodQy
	CmmQk00ek4mdpb1HQ76wbY4w1OMymzHRnnterk0WThA9gBSpzlcFNTDxSNSL7F5f
	9n87E6IT/aWqqIVX+OOuxuqDpniqCb1fzMUZJErMG2Wvv++a94wRR+s9+9liYB3G
	PTcPf4ZfZc7Dom9gPW/IkQNp7i8y0RtYitjKvbhChqqtkQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvqbbvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Mar 2026 01:00:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd827a356aso1034456185a.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 18:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773363619; x=1773968419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=umDVeTcpAWbzP3AnJt/b1Qw3MTgZdpp50Uw96KR4UKE=;
        b=kh0nUhZ9Z135fRUx35oq0pdBw4G/cqCvZ0p9xBJZKvofig6sfgYI103QDs3n2RgWBk
         0AfmANZfYmFJiEX9UKz6BYqLuvfQQVxqy5AQJ9cbD706OKGIFvVoXgH1V5Uz6KjRjbik
         m7oolEJcDm2MpdRSjnPx2gOE40LCSZN9bvq8aw+7Vws1Mv1JvedCWxlIJDTcoC0Z+Z52
         D37CyJ2UgZHSNMt9wG1LwZpS14ngAxWJk8jelta9/NJGGU3uGYT7mUb9odsekvfIVyzS
         w5BAFi+/TmLb9GYr8NTdiQTWo/LQC5aoHy0YLhrM4vipquupd3U+G3z0u8Yti+045lZq
         grhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773363619; x=1773968419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umDVeTcpAWbzP3AnJt/b1Qw3MTgZdpp50Uw96KR4UKE=;
        b=niFnhC+ddqXE3+erCt4q4HfNDPjZfgQ5VOLqXDbifDvBoXqCiEjwVFmE0WAue6gSIy
         NLOScu9cJ17upW+oHOm7Ko4sgRN888558hOXMQcsNzH+W49We2FhWmiWFCk9602OMz+5
         ryJoS4yD71+2ZpRvDytzs9zPZANJkli3mC/8K9dl4XoijzIpxiK11UhBXsG1j2Oczrbp
         bSvwhT4SvDwRnn2+GvwCfvfxar6iOgxztdiQ8iTCLEi8Yn6BjersNrvXViXOzdmRwj7k
         Jq0+gnI2fFRqFf9S/vOXWlXo16DFu4fuwNr/inDZ3nxsPzlKkF2FkYoZneQ8yVJ5jWs8
         LvjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUcAWH0KRITLczQfAhGc7UrAfebJd2aAgZ4DeeuVC6hkAhxEhogGeKraG+OIEleUboWGtRWamo+k9upY8D3yBp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqi2pb2zBaUMKzZ0oZX5INpBLozoylKAaI4/1m+1hGddhzISj8
	dK52aNtntCkjxz9CMa6hoJ3omROfPvnk8dIy+E3+UdHV7KG4bbdNR/lb5HXWUzn0bSzUHujAupS
	hpJA2aoW0rs4SGURysi0pUxzfhkwwc5mOoGgGjtG2lXHZUgtQFj9eM2+8M796QRVX2fZkUDOK
X-Gm-Gg: ATEYQzwlIuitXWEZ7VGXbVX6SrUVT+fGbJljuutFv3JyLBErCOpMG0lMX6tchuqTNzj
	Ke+pu2IuRkGAF6PmmIiASsUZ3juIX4k/kSPTayTGJQdaCZ62nldbtf3CV0SdJtI/qaFe5jrUvN/
	Jov0q6OX3CumGET99iDS4oDDAWhaNidxtL7NNRPi6+L8vPU+8r383HdEVCFY9JdHxDJMPKUppAZ
	0cmmPWG7CJnkIHpP4XZi7Ec4WMCqasQh62iYV7mpjazSCYP0S24jeCJ2ILLgUrQ8QxbWhtHo98e
	4iDvFN1sgALBfnDfUQSruGFvh5vptlj0XP0hsUSuiSgAFgwXlaO0KPHD2UrQHbE9n1LC2GBFFcq
	LZOF3tDFXv3aq3QiT1sUG459ogQQLnISY/mN3pvNplE26EenV/nEPERXBAH5DAMe76K9Ma+G3In
	MRfB8/tzoOQlEmvkCmDBw2KV9C358uMGri8Z0=
X-Received: by 2002:a05:620a:2954:b0:8b2:2066:ffca with SMTP id af79cd13be357-8cdb5bc5d2cmr232026985a.82.1773363618999;
        Thu, 12 Mar 2026 18:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2954:b0:8b2:2066:ffca with SMTP id af79cd13be357-8cdb5bc5d2cmr232015585a.82.1773363618301;
        Thu, 12 Mar 2026 18:00:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67e6dd87sm11964741fa.35.2026.03.12.18.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 18:00:17 -0700 (PDT)
Date: Fri, 13 Mar 2026 03:00:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: remoteproc: qcom: Document pas for
 SoCCP on Kaanapali and Glymur platforms
Message-ID: <xpgemxotxbybecseyvyuu4v2m2yz2kerwo2tf2xvi7xdda6w7p@ezvoc47pqopt>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
 <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
 <20260311-unique-daft-nightingale-584252@quoll>
 <tpoksnga6erjhoh37vohoqw32fe62wbhjg74tvulgyn4jt2nbi@kamwahlyuqvo>
 <bfcaf538-470f-4766-8ff7-122901872a75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfcaf538-470f-4766-8ff7-122901872a75@kernel.org>
X-Proofpoint-ORIG-GUID: TYDZW0Wwp41Gz4UWUcMxCdnz7HeNQhRT
X-Proofpoint-GUID: TYDZW0Wwp41Gz4UWUcMxCdnz7HeNQhRT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDAwNiBTYWx0ZWRfX0kAC79JBMns0
 IH77uLvQFp0WUMJidRKg9SA24FQvw73nntQZ2E8lM3qCYR48G2IoPLcOLhReSx5oYx3Y+eETJcW
 p7jnHqbKOPeVkqy3YNPhHsQu7nkx/pwD77XElkkjbsIcvHP5DtyzScRpNQNtIaYOpXRGHYQI4C0
 NQf7DYV2ltHAA/mNrJoQ5uFuCEU1ikO2rwsAfLxIb4DIe4sIasmRzvVDnBsbJDfEVeMu1NZd/Ig
 5181bqw+SRSV5lTItzA76Txx0zb1YFiVpv9HYzHajYX/4z6WGeqZWcNIHHlyOhqcdU+yCLxBTYB
 LdtyDFBMEBFZ3bGquHcogWlDz4PmQGo299Sx65D89Y76woGGzqc6RPSHARSCG/UEV5vlD1lWdOW
 ESfDqEOM2f6jV1pkRAvl6SsNGuk1VXpkXsm7U7DxLws9uVw7VM+8wAacSbbRKqxC+lPdbhMb2g6
 fgb8H5oVfizTVp9GEVQ==
X-Authority-Analysis: v=2.4 cv=ccHfb3DM c=1 sm=1 tr=0 ts=69b361a4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xUKN_BiNDskXMR9hgyUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130006

On Thu, Mar 12, 2026 at 05:08:46PM +0100, Krzysztof Kozlowski wrote:
> On 12/03/2026 05:53, Dmitry Baryshkov wrote:
> > gn Wed, Mar 11, 2026 at 07:26:38AM +0100, Krzysztof Kozlowski wrote:
> >> On Wed, Mar 11, 2026 at 04:04:09AM +0200, Dmitry Baryshkov wrote:
> >>> On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> >>>> Document the component used to boot SoCCP on Kaanapali SoC and add
> >>>> compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> >>>> the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> >>>>
> >>>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>>> ---
> >>>>  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
> >>>>  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
> >>>>  2 files changed, 159 insertions(+), 1 deletion(-)
> >>>
> >>> With all the changes to pas-common, what is being left in it? Would it
> >>
> >> You need place for definition of properties - smd/glink-edge and
> >> qcom,smem-states. The latter is actually not properly defined in one
> >> place, becuse there are bindings having  it but not refencing
> >> pas-common.
> > 
> > So do we for schemas definig smd-edge.
> > 
> >>
> >> It can also define common order of interrupts, but as you pointed out
> >> this does not work for this new device anymore.
> > 
> > Nor does it work for SocCP smem-states. I think that having such a
> 
> It only does not work in full constraints, but for defining the type it
> works.
> 
> > pas-common overcomplicates existing schema. What about splitting
> > qcom,dsp-common from qcom,pas-common with the latter keeping properties
> > that are common to existing DSP and SoCCP, while the former being used
> > only for DSPs?
> > 
> 
> What would be in the dsp-common then?

All items that got spread to individual DSP schemas:
- single item in smem-states / smem-state-names (and maybe the value of that item)
- 6 standard interrupts with minItems:5
- XO clock

Ideally after this we can split qcom,adsp.yaml into several smaller
schemas de-monstrifying the if-pile.

Anyway, current patchset has another issue, I'll comment in a minute.

> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry
