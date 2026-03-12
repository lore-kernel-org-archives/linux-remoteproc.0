Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704AE1DDC28
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 04:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773291189; cv=none; b=UVSNtiNOibHMhy7ltCrVeSWhbNUwdGoMd+dIA0/y1WGgfyNm5LJb/D/Hehkfww7GSVYTZGq+h80GgI0Xq2OmQUYXyslO3gUFua6LKIs67gYBSoppSET4OYhGNr2IqsSRb49dXV3zWNZjgcW93ApjBknnmXgI3dTtK20wAagPHzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773291189; c=relaxed/simple;
	bh=lN/KbGQqw23Tc2KDnTrwaaYJdfzwqq6mDA68SJrn/qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aeU3z8xd8eYQY3bDPW9/z9tGgj7O+XnA/FiVnhki7UnhERBnOLi85Be04QLzsXgKjvdJ96A26weojfbQTj3ra7SO+NMiIKTlAuqT2MPS8WP+ZqeJ7MZlSQ800OuSk9i+zk7bZKPk1cUyvIUIcA/gwd0ssLmhvjSfXq28PcBW4Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dchCiEM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FH4PlfAV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dchCiEM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FH4PlfAV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMOmvw587637
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 04:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jl8minE8nYKp9+OT5OcDwwB9
	zbvmYytTY2026ml5RWM=; b=dchCiEM32H1zvmnyTX/vqHJhwhPXOd1shQZkhVW5
	V6JQK1FWz/BmIBAEIbi4Z2Z4wiXWxVZu3Hp/aRq+HAj4zfh3q2p1Az1vuY68V/xF
	/C785FdLoLRzk9VQPY56W2PM3wGpvasy3MCx6w6dUvphruf8VSpg1HNrnSIi780+
	qPIBjwU7rCj0FFs4XnAMBQStvoLjYMDRb6q0ibyJNRqZfHCzFoqVhpchbOjRHtTZ
	O86Qjc+g7ECZWed9AtjfiZNfaqBYy4CuSOy0qWwNGniA91ioKA6Nbe0qvdxnz0/T
	Ins1Kjn5mf0sOAlMXL7GiSUhjwG6VR6/+dHI2YqG5GzLEg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh5q0w70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 12 Mar 2026 04:53:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7c4ab845so280809585a.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 11 Mar 2026 21:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773291187; x=1773895987; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jl8minE8nYKp9+OT5OcDwwB9zbvmYytTY2026ml5RWM=;
        b=FH4PlfAVx+Zn317QI9i99LL6AJKOy6emI2z+8SF8AyM0nfPOR1luf940F5RNfVpFF+
         fqfB8o4LT4vU584vSwsAP9e2op4KVEGLhK5KDiq5e3zRPeNfG0PAELjDGOX0/dINioUM
         mtai9JKZqUuj6IvVcc7ML1UBASnCnZle3TQEYXe2J+5k+c1lA5pJPGSkSlkzycK+NxLN
         o2loj5SRYQLNT5gkwyWnmq9ot4qEiZEi2x+X1GofYXx7rrKTvzipxK5EsOE5LvE2IIrN
         CbsUNwQlE+ac3zozmSHIej9oLTEc6rPezsnIF9IQ1zUUztA1YmShYW1xECdPK5hHE0hg
         N2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773291187; x=1773895987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jl8minE8nYKp9+OT5OcDwwB9zbvmYytTY2026ml5RWM=;
        b=c+uJDD7tRAH0rnf6WJ4zLigSh0yIMNwYeMU+YAf/Cces7otrWLxOh87oCvUCdVaJul
         5zPjtrGOX1xULsUYsaUsQj1z1VEQW/BDumQJY2FX+2nKVx9vU3V7Zvwqhhp6sTa7gP+T
         jAZda5lPQIiZL1UTejjdHCy6pNBsbTV0PQQiLAljjG9PwekMj9omjfwz0mR4DJY7JMke
         tnmYUxKi+HyswooOaoSTqfEuAr43oKEnUo7WCmFpdtBZT+UizTPUnkD9Q7e2SmwkNjcZ
         ZRMPvHzVJbMgr4xdk2J5orlM1r2PHPe75jp7tqnGG1bkO0NC73ZJobb5MA4iqBlpu4Aj
         851Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2ecjHFmwoH36XEsMPkQWNM8yFwqw/GFEu423XaEQzuld+ueXihlJ1Q3gGjp8TdNyVrfOYaJ3hAagdPOgx2/8S@vger.kernel.org
X-Gm-Message-State: AOJu0YxC+GrDcmOIDlt71Zyz8Ed+RQXUR/+LbeuTqxjV616OasTpuyDH
	zNh35DBFtrhbOpSImKzq9YlgwWhFn84qHbDkoI8jRIQca5EqNeTT5rq5sXZWFpxleJjX2TRRQF8
	P9LL71khVxK1gmCVatMnz1eq0X2O9RaijFXnBuMGlk8adupRA4UpjbaO98e7ZRU6RvfWbHY9h
X-Gm-Gg: ATEYQzzxQncskwzdb9ZJL49xYxpWww6vC9q5vKAqbDHnxkphiTohO+0iEIXYmHj2EMz
	OwohbReK7+OoqQqnSceb+p6Ye1yRjS61oTThr9ieei7YNJqaPi9NOs34g4OkSCIdYx9BdbcRWe7
	/qLlwjkPbFBhuKxpcR/pgK7L9QwbNBrtNOhuNiR9s5yTMGUM/gUTJFYvyhIOczayImcJxkhgpND
	PcC7r10G3zrFV6nYUwMV6yZHvzZIOSXboWdpNWIsnEQhoGgRs4XbmDXWdAexqEQ4p4tHYOI2h7A
	tY4Zz4KNGkoYjlqoOMsAvNnIvJsbtSVs4M0yGSySkPQNEzO4qlDLpdwzBEdDAtb2eRGSpuGyIBU
	iy37F95mV0UloblZEkg/4en1faYSrgpOnJRUHgKPEjM3dkzVkZR9YB8A3Um07gFlJtpUBfSz/Jf
	4/re9jJIXvpdRUlB7LVdgxCQFLUu9DpwbWy8o=
X-Received: by 2002:a05:620a:4153:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cda1a56db3mr613114885a.67.1773291186606;
        Wed, 11 Mar 2026 21:53:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4153:b0:8cd:79aa:693a with SMTP id af79cd13be357-8cda1a56db3mr613112585a.67.1773291186087;
        Wed, 11 Mar 2026 21:53:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15603487bsm739851e87.41.2026.03.11.21.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 21:53:03 -0700 (PDT)
Date: Thu, 12 Mar 2026 06:53:00 +0200
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
Message-ID: <tpoksnga6erjhoh37vohoqw32fe62wbhjg74tvulgyn4jt2nbi@kamwahlyuqvo>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-4-0a91575e0e7e@oss.qualcomm.com>
 <oqvq52az6iknhg4negqaprfsx5dfo527acoeas3tusqpqvak2c@wrdmsydyy6ns>
 <20260311-unique-daft-nightingale-584252@quoll>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-unique-daft-nightingale-584252@quoll>
X-Proofpoint-ORIG-GUID: JNMYrgvAnjQ_01dh0CeTuEWBzXLJqMi3
X-Authority-Analysis: v=2.4 cv=CIUnnBrD c=1 sm=1 tr=0 ts=69b246b3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=n-Yar0ZZng0pcsCwfiQA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JNMYrgvAnjQ_01dh0CeTuEWBzXLJqMi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAzNiBTYWx0ZWRfX3Dn/s1koCozR
 /lNA6nrM7h8fHffyxBIImKYO1D2dKoN5xX8W8DqNOoVkZVBpxwCMNX7Fk6Pa+os1WiP+z+A8uAF
 OM5G3Eo0nV0a4PH+x7tlB1T41zwHLc6DmkzZdMYcsXqRHQ8UD+DCyG3yP+yKFhB8WjY8ok9REzq
 QvoZYDITT73wzymT1q1slrx+fnodXlWJCDvPv4RlR91oMYb3EjM1MBlOwcanD4FgruzKqUlrNgu
 +w267DTom9odjV8j02tbPGYp80JQv4JFJnpC5IN+v9kbOfeYtKOiekincsZ08WLg984NFeta526
 mjSgF2qQXIwCDwqkAronjlo5J7wtVQymRd441VYM0WIqsvT8nb7fg2G1/a2PPL5wSqsQ8peIxE+
 gGaYzWbA/2bKNoGHjccT4igPAkxa+XqJHVIbYtLIEdDUUzSv1lv1ikmlwDShpt4uiT14TFrmU6U
 K0QyUR/IkxpZVKzqfug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120036

gn Wed, Mar 11, 2026 at 07:26:38AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 11, 2026 at 04:04:09AM +0200, Dmitry Baryshkov wrote:
> > On Tue, Mar 10, 2026 at 03:03:20AM -0700, Jingyi Wang wrote:
> > > Document the component used to boot SoCCP on Kaanapali SoC and add
> > > compatible for Glymur SoCCP which could fallback to Kaanapali. Extend
> > > the "qcom,smem-states", "qcom,smem-state-names" in the pas-common.
> > > 
> > > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> > > ---
> > >  .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 154 +++++++++++++++++++++
> > >  .../bindings/remoteproc/qcom,pas-common.yaml       |   6 +-
> > >  2 files changed, 159 insertions(+), 1 deletion(-)
> > 
> > With all the changes to pas-common, what is being left in it? Would it
> 
> You need place for definition of properties - smd/glink-edge and
> qcom,smem-states. The latter is actually not properly defined in one
> place, becuse there are bindings having  it but not refencing
> pas-common.

So do we for schemas definig smd-edge.

> 
> It can also define common order of interrupts, but as you pointed out
> this does not work for this new device anymore.

Nor does it work for SocCP smem-states. I think that having such a
pas-common overcomplicates existing schema. What about splitting
qcom,dsp-common from qcom,pas-common with the latter keeping properties
that are common to existing DSP and SoCCP, while the former being used
only for DSPs?

> 
> > be easier to leave it as is for the traditional DSPs and copy necessary
> > functionality into the soccp schema?

-- 
With best wishes
Dmitry
