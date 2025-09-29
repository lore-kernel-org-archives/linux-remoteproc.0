Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849B1DFD8B
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759138504; cv=none; b=UR5EFXvILX0bvoldPQbe+XJIAYM5g7+7/5nkgHP7ZNx1N3PYdfUu+IbhV25WNViVXHVIt3evIO4SQ9peSljrlLlYF8LEFo9JmN6XnZGMm3/y0cy86NJaH+04IMw1bW+jc1HtB5O/Py3orrEiptG3csz3V18lrzYIieVWKJXuUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759138504; c=relaxed/simple;
	bh=mRsX3dKnTVn76I3diVMRJ5PswMmK69nK7/3BH+Z/a+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8AG+ghp0GXAUmIxk0nYN0piULXBuw8gVGI0LQJWoTSI2FlFCcm6s2CmZIJogNK8O8eFh4O6H3RF+/wEgsduwJ2lHs96nuv9Vq+Uq1RAalmFtOC6CMKRx46WV9i29pBlKOtlYIuvmElPtSRcHlq4Yh51ACYBy0qPwFvve1Y1KXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RgMP935D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RgMP935D"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SMvHfZ026887
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:35:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmYtyuvX+TYSvsQjEOU3V3kUhRzcJFG8FYtCxH2TOxc=; b=RgMP935DOHr3mR/S
	eBCkOClNI0KyaU6v5fUmAs1NJhHBRm4YeoR/LeMdiSzatVciUR1yTwE3k7ZQzPxL
	AFX3iwt11Ele7NWRlHPq+6ov1+8sfzU//Y2MbM21pjqL3Bcpjr0ZlDA/Uo0aFdas
	N7AHE9b3OgrFAB5hB3ZQaa9BdEDMLJ2Zw0RCZws2c/KdrHBUdppaF4KLuQzsMUNu
	WCUBJg+58UBd1zbNXTBAvTR9NfDPVxrXaBRk0d3fncEQthttjyCHaHjIPtBBRKS0
	4onkcwrIbrcWpDUaWSMZZTLICsdjFENv4pF+u1s7c0ft0sH5QsAgjJEMkl8uAZdb
	Sqw93w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5mr2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 09:35:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4de2c597a6eso95780841cf.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Sep 2025 02:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138499; x=1759743299;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmYtyuvX+TYSvsQjEOU3V3kUhRzcJFG8FYtCxH2TOxc=;
        b=oxxUZ1clOQZPota+P8sJCkUvLeovy/DiqSTZssrnxWc/Z5AyZUCd2vI0tAiGCAvDPh
         8PvbQOBDnfxjTQLNIaxrpFznuP9D36EdDwU21+KjTBb5oKHB6qqlJK4YBPijGEbPyjDj
         dPm7Ie9L+lAziaycun5Uguvp+H257SW5Iq5KpCaP9y7e9r9kosqoPoB3X5XiEJZyXkBf
         F06RORoAwxFWPYa9BjDJ/Ag2MGqJLdOjeqxDRZP7CGoxAsg6JFCLNEKDfkS42SPpobXE
         eon3LMn0ILpPe1/VHKEBFOPIrGWgrg+pX1AuHTkcQuoVmKvNKR/gwkW+gHvMqteLMglv
         5T0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWP+gj8lQ4Nog5Ss1BHYj2lwMjM7/xxt70B9adLzgum2pwQdQ5hAWK9jQh8l4iCICpfiuC0zIqITeu12fG6rsE+@vger.kernel.org
X-Gm-Message-State: AOJu0YzVtKwA58IeTbJm1kEmV5sGAFXBll59vOiMgBuuiAjKUD/07OMq
	ZTpCQwQTPD7eFpIKBYaq/p2Em57tocc+HtH9sNC2XYQedcEKX+bYkoFP81xMpDSzArEDx1Ongs0
	xnzOECRMqV9KL7OeBEjl8FAf6Axci/QgUSYMiavoTV6pqWaZFJC+IQTm1jiAW0uo70Qds+Z9U
X-Gm-Gg: ASbGncuQebVq2Txkl7DQ5Hv0qkFE22996LeKq4RZekNPN7//qBZX2D68wfgSXrvWllM
	4PsX/GoDLLM0YTeVrSiFYfo7B9YnIyh4g3X2dqbilg9Vn3773G3rl0QDhaYeamvsiCCWhnV3kRT
	zT1iy97Io9BybRUGnAI76IpJi7d4mNOkGyo2T8v8NwusjbclXpy0IPcwQjqMVVMkNcA8J3Q1jr0
	kvL+VXdVE/DJUwzzsdkoghGQuZj+p2Y8nPO27Oe/XYfZO32Jhm2LMwytLZfvtxXzgslyDxNEg96
	FnnBpB3qoKfotX0Bk+A4IiVtwDba0ibFPnXq1ktGrm4GNvrTORe8da5x0ecfFZGsINuhBA9Ozpi
	g9557bCZlGrvGBvOVoyl5R/K+X5YSPHl2h6cUQwSn/obetpDMRQ8z
X-Received: by 2002:ac8:5d02:0:b0:4c4:695b:9712 with SMTP id d75a77b69052e-4da4b809717mr225385711cf.42.1759138499596;
        Mon, 29 Sep 2025 02:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAVn+j+N/RqaW9AiYNNjjr5aDBEy6eHhXUJcQNHS/ynl5kMhAJNVTVzSOT1Symi2t4TjZugQ==
X-Received: by 2002:ac8:5d02:0:b0:4c4:695b:9712 with SMTP id d75a77b69052e-4da4b809717mr225385321cf.42.1759138499151;
        Mon, 29 Sep 2025 02:34:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139fb04dsm4059633e87.44.2025.09.29.02.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 02:34:58 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:34:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski.k@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/6] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Message-ID: <o6dzhmlicwiezmxlb5uqitx7e3pjpyuhbjqfumivbdkru42hvn@r4ksfa6m5nd2>
References: <20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com>
 <20250924-knp-remoteproc-v1-2-611bf7be8329@oss.qualcomm.com>
 <CAJKOXPc57_0pJ2ZWf2cKSKAcQMc3S_mHKQxJDzWH7t=mgim3CA@mail.gmail.com>
 <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5820a9a9-4474-4c4d-905c-0efd9442e5e1@oss.qualcomm.com>
X-Proofpoint-GUID: 3nSfCDmfDWkvxJxtrwiAxHeKN-fAqjPs
X-Proofpoint-ORIG-GUID: 3nSfCDmfDWkvxJxtrwiAxHeKN-fAqjPs
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68da52c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Gqe_g9I57pFxb8mTp9UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX5jl4UXsRfju7
 Yj7UCa1KQYwIijWtpNOB5VaGNgWLEev2cbcK9PEwU6MuDpzTxl9Mf6VSBWO/zzE3kRHU4Zcli02
 ybeAp93aMNeko/Nr09+wuzRHxKAFFLW4ZrlnASXNhyrV8BXrv8Jlw/UYx0JICLg86bOiZdI/Yq2
 xCZIbzUR7RfA9eDZ0yGZknuo07dygRng//NboaAEVsvdb/PIdXC3alq2CFA+WCW+HyvkL+EaVQK
 +C2CDG/K98Le4tzLVjFWqVQ2lOvL8QQOy4hD53m20o5iF8d9p980ewYkH0JGlA6aKAvecyxalxo
 RZot8e3R8UGeDlOYTaBeKKsbQfxIFqntwgd2efaLsjdY0DaxJV0CMN1DCzYMw3cK78m55AX6jXA
 sj9AcOYDTdnelVI/jsETnc24Ex8VBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_03,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

On Mon, Sep 29, 2025 at 02:20:54PM +0800, Jingyi Wang wrote:
> 
> 
> On 9/25/2025 9:48 AM, Krzysztof Kozłowski wrote:
> > On Thu, 25 Sept 2025 at 08:37, Jingyi Wang <jingyi.wang@oss.qualcomm.com> wrote:
> >>
> >> Add remote processor PAS loader for Kaanapali CDSP processor, compatible
> >> with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
> >> interrupt.
> >>
> >> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >> ---
> >>  .../bindings/remoteproc/qcom,sm8550-pas.yaml          | 19 +++++++++++++++++++
> >>  1 file changed, 19 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> index be9e2a0bc060..031fdf36a66c 100644
> >> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
> >> @@ -35,6 +35,9 @@ properties:
> >>        - items:
> >>            - const: qcom,sm8750-cdsp-pas
> >>            - const: qcom,sm8650-cdsp-pas
> >> +      - items:
> >> +          - const: qcom,kaanapali-cdsp-pas
> >> +          - const: qcom,sm8550-cdsp-pas
> > 
> > 
> > This time maybe without HTML:
> > 
> > This looks wrong. This is not compatible with SM8550.
> 
> Could you point out what is the difference from your perspecetive?
> it is the same as SM8550 except for there is one more interrupt,
> which is also described in this patch.

I'd second Krzysztof here. Your description points out that it is _not_
compatible to SM8550.

-- 
With best wishes
Dmitry
