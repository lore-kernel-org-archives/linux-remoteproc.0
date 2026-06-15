Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDED3B7754
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 22:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561718; cv=none; b=F+HBEnvHHbHqK2p8ohWC6gY6I9qtbKjCMmm1gkcSR3LbYyNmy5dfpVtFiEXHuW4VUxr3MeNhZ5RE751Uv7qVbZxzFOZMpIkO4Kmc19LpKdkbIEL4DsyW1WxtDO9jOTSpMz8ZWWyJKA48sY5whyYwM2JdNhdqAEnWREmEQqIV7Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561718; c=relaxed/simple;
	bh=AXBLzzulpn4xWm58R3TpasjTiqgOvCS7YI4V/xxrVGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpV3nuR+y24tBo0M5igZJFxljIdJTKObn56S3LFDzeeTra2Mzx0nbSL7QYIXE/GYtPbYHpfoix4uwZcKmDe9GkspHqod6Y4K1vC86IJVzLz0virE4N2DiByXOX18Xkxw7uHlqOCzzGoRdggqSUBnt//JwqiHBN7BxfEnnlB6fJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnry2d+l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VUMyO2eN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnry2d+l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VUMyO2eN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx6sO881968
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 22:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QRMyGJh84hJPDNhZ2ap3yWnmtzAfq7qSnYrooRo1ac8=; b=nnry2d+lXFjzoT11
	BRHH062YLf2zqmx/MAKLAm6j6SqPclgK/V9owp25O4jDk2mn7sjDFOeXpb9N7kZ6
	W34g5QyS7I6zJGRAhpI6ixBlcsxiZr+crXfSRfyf3DOxly3w6eobOV/EQ4DMRCag
	Oy6HFcQmsz3RzQziDtEWRJUpVbc9sf16wuUig8zDGnjuO+XN52vlGOLTeIdA/+22
	TKfL30eitl8z2RZgibkqueJK6Sz6KmQ1rADFqgIxvm7hdfOJDYM1BDlLWPxvO7tl
	aC/DPQ+S7WnlB+SIS5t8ddCjxV/k7veLLDsGZ2R/tYnVIYtjqln75/M1c5IDCEzG
	u0Z8wA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0kan6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 22:15:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157c8eb597so618505085a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 15 Jun 2026 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781561716; x=1782166516; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRMyGJh84hJPDNhZ2ap3yWnmtzAfq7qSnYrooRo1ac8=;
        b=VUMyO2eNSMFDbcXFxYQAZL/f22gi5uZnzsNHDbPxemTpxmV0zST8u/oB66WjNrHPFt
         osSx5EpAgN4KnXFWmq87qp/2Pxq6e5aiTbdSA1pqBMPSZR/GXrpEyS+wkdWukWJEfXcZ
         2OOkupfhC5fmnMis46RsJZA6QwoCgX2SLaeBk5D+AvL21iSc0bFS7L+hvXncTyTeQk1U
         jGp5KeKvDwzt5dVHvTXsof89KngPeejymN6DU3ZYBMXmDoC59VgnBTjH3VMnxTilW4y5
         1TEwnkwNYyuTzCzUzMEN1UVqDsobIsUyBZyBkpTcCQdXGAwx1g2b1dkNHSjD2wqpd6sC
         5fSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781561716; x=1782166516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRMyGJh84hJPDNhZ2ap3yWnmtzAfq7qSnYrooRo1ac8=;
        b=UJJdJ2sDLaJPeSAPW/Io0TcN+NuyzC8+/J57vc/L274GPND3x6t/CxliQKeZTjHknR
         d6E5bBOdcZyKFmMg0/w/dA5l9vTkdVIvc1u4JXq50j4NYLkdYJVQp+Dlm3CjWhhjKcSx
         t9DdxJxaTtoAVKEJdQRA4KQ0Sk7z/GKyJmgjfLTT+UZiFvhyp8IqKxMXIDXZaerTN3O+
         hrAgIfxpZ8ud+Pc3micQH38E0MloH5vklsK80TJ2CT+jr3TJjXx46CSDq10SXjxpl8qD
         m27Os4jDxGFXXPLe84aVgyheHjvl4CaQORUPbSh522i/RRIbm6RbhL5pwXI8G/WaeJMR
         RrXg==
X-Forwarded-Encrypted: i=1; AFNElJ94eHNiSK8V0Cz8zS4ESd5uOTGQHcaCJ3iwi1EGvCiD1m6UJblLL6gnK3v5brepw/juWAShyCk3kn4iCfW271Hq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe/GszEi7BEURdj9ZqdPt6z9SWOMfYkBqpAuuVBFabUIWWCuex
	p0rvARkqcGGjDqmCl7g3S/EX5gz9+yDq4KUfrnOnZEz3Z83Fkoz5odGVoTcq1eZNTc0ibN7xkkH
	paVvRWENf8wIUFGFxvCPLUmDTtRt0idgHaG7y44Rk5tdTrP2VjcR/VFvkNo0T0WAimVuL0I6e
X-Gm-Gg: Acq92OHBZOsmd5AjMvpXaOo2fjeWJy5n/QNsxMv/3vAwXSkL67FCCAub0+EmPOboXYx
	pY+77uiOJggOQ3UpjgLFSYoiLHT5/sSIHbYXk6G4HgDzBHCoBToujV6Th9v+seEYkhCzgBRrdva
	jokHgveDRvDZOr6vX83XKis8yv8a49U86hKZB1kDNUVlTQJN6hNBDBMtW3B8mQbRivBY338xzlf
	0R8yylQUlHxuJlrAcCirGPb3Q8rIO2mShAPLb23K5ZEQ1gVwEG8ZYdrfoa80qjGlNlMtk08rq/9
	wSNmyH4vLMQNbC0pS6UyxcIn+I1tfXsKpgcJBFs/sW7JACgGw2RSkRhwqGaaFV5ouaVHZgg8keY
	OfvdRodXBtqF4Ntw38/J8/B3GdbMxN4POCfgKgTvlpnRMW0r7JLvs4RthMKZ+aMD6zCQuKBNo/4
	ro1RzigaxcYpbvNgKP70zvbYg4aNrx9J7NPxw=
X-Received: by 2002:a05:620a:2252:20b0:91c:6dba:3d66 with SMTP id af79cd13be357-91c6dba464amr51855685a.16.1781561715571;
        Mon, 15 Jun 2026 15:15:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2252:20b0:91c:6dba:3d66 with SMTP id af79cd13be357-91c6dba464amr51850785a.16.1781561715088;
        Mon, 15 Jun 2026 15:15:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1717b2sm3037617e87.36.2026.06.15.15.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:15:12 -0700 (PDT)
Date: Tue, 16 Jun 2026 01:15:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: qcom,pas: add thermal
 mitigation properties
Message-ID: <4gs664zboaqgpok33x7bgorfmhh3f2fahjkt4jjl6fbzpwixnm@hxzz2xeogd4k>
References: <7f1e46fb-15e3-4638-9930-8abc1dd5a778@oss.qualcomm.com>
 <fcf93e0f-a2f0-4070-86ec-8a34e9344b76@kernel.org>
 <ec65893d-873a-4a62-b0e2-5008b2130545@oss.qualcomm.com>
 <3cbcaf8c-357e-42d2-91c1-9d1a32c55ed0@oss.qualcomm.com>
 <ae43a691-4879-4bfa-8c7c-1be16945480c@oss.qualcomm.com>
 <9a31bb29-75d7-42fa-b8a8-4155cf85cadf@oss.qualcomm.com>
 <hebyboondtxyyetwuwggoiysurz335xzn7asf6yit3qrexap3x@kngk2m5xum3x>
 <93e7251c-c75d-4e43-9ae2-bf485af58de3@oss.qualcomm.com>
 <mp2hl67rupxrssa43dcy36m3dwatlxsu7n27l7qdqsguo5i3bp@bo6sdzxglxt2>
 <dcdfe9f4-aeec-4d85-92a1-a42592fe11c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dcdfe9f4-aeec-4d85-92a1-a42592fe11c8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDIzNiBTYWx0ZWRfXyHTXw5IjYUD+
 rU+qZcsTQacUT4vUy1H+og4pRBQNYi9s4Sl3b/GBUzDRo2MA5UFph/wSbJhE5ywq0quTDvlrUqK
 sUQ1yaojBH3NDe+Np+ZoMtNdbe0qX/4=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a307974 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=SWO3QfLWFJOVKKDWiRoA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDIzNiBTYWx0ZWRfX8mf3ZAnEg2nR
 pUBpN9e97M4UthOwFCUXrqIP+c9dt5nH0tBn7lAGh+QpHFdyiNxrHyoI3u0suNFkoRpAI6ouNdM
 ZNOPPNBcstpeyKncwgB53Yb80cs7rO+/Li+Ezx8FoEXkNpEHniUPlh+1zWBJ/9G/IF8bxrvW/Vr
 E1+tlNzZwuIexw/R+awkw9r8RLWCdSIOxJDePdljttTKIYH9UhP39fkxG7CkkFP+ETPIRr7oiAI
 8Q0AKeEkIhIZeTPvGsXS67X6WCePLJCf365Jv5EblXsDAWrCVtyyMCZ2TffrdLZ21pk1MymQR29
 2ZV6H8Nr6HuD8vv7bTTbMzmkmIVFpnF4RAhXe2rzMEZvuSsEM0Qp6Nnk6yzMyghaziTMuj2n/2d
 yYg+YiLPok46Znc5/3ImfgBJvuVMBae7SbHDGIOU1dE3/zXHiFa892Q/ciKxIU4CdbSVL2LZ71u
 TZqXjZTK4SBWQfI2Nng==
X-Proofpoint-GUID: tKsw4O9DpkAylItCfo8NGzQjfcZ69bWO
X-Proofpoint-ORIG-GUID: tKsw4O9DpkAylItCfo8NGzQjfcZ69bWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150236

On Mon, Jun 15, 2026 at 05:33:15PM +0200, Daniel Lezcano wrote:
> 
> 
> Le 15/06/2026 à 17:14, Dmitry Baryshkov a écrit :
> > On Mon, Jun 15, 2026 at 04:33:38PM +0200, Daniel Lezcano wrote:
> > > 
> > > 
> > > Le 15/06/2026 à 16:11, Dmitry Baryshkov a écrit :
> > > > On Mon, Jun 15, 2026 at 02:30:49PM +0200, Daniel Lezcano wrote:
> > > > > Hi Gaurav,
> > > > > 
> > > > > Le 15/06/2026 à 14:12, Gaurav Kohli a écrit :
> > > > > > 
> > > > > > 
> > > > > > On 6/15/2026 4:04 PM, Daniel Lezcano wrote:
> > > > > > > On 6/13/26 13:05, Gaurav Kohli wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 6/13/2026 1:11 PM, Krzysztof Kozlowski wrote:
> > > > > > > > > On 12/06/2026 15:52, Gaurav Kohli wrote:
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > On 6/11/2026 5:53 PM, Krzysztof Kozlowski wrote:
> > > > > > > > > > > On 11/06/2026 13:12, Gaurav Kohli wrote:
> > > > > > > > > > > > > Why? And where is this generic property defined? You cannot just
> > > > > > > > > > > > > sprinkle generic properties in random bindings.
> > > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > Ack, will add why part.
> > > > > > > > > > > > These names are matched with the thermal
> > > > > > > > > > > > mitigation device identifiers
> > > > > > > > > > > > populated by remote firmware over QMI and define
> > > > > > > > > > > > mitigation devices are
> > > > > > > > > > > > exposed as cooling devices.
> > > > > > > > > > > 
> > > > > > > > > > > No, -names correspond to values passed via DT, not
> > > > > > > > > > > some remote firmware.
> > > > > > > > > > > The remote firmware should give you interface which
> > > > > > > > > > > is explicit and does
> > > > > > > > > > > not need such properties.
> > > > > > > > > > 
> > > > > > > > > > thanks Krzysztof for review, We need tmd-names because
> > > > > > > > > > of following reasons:
> > > > > > > > > > 
> > > > > > > > > > Following Daniel's series [1], the thermal framework supports
> > > > > > > > > > mapping multiple cooling devices per remoteproc/device via indexed
> > > > > > > > > > cooling-cells.
> > > > > > > > > > 
> > > > > > > > > > 1) The thermal framework's cooling-maps reference
> > > > > > > > > > cooling devices by index (for #cooling-cells = <3>).
> > > > > > > > > > Without tmd- names,
> > > > > > > > > > there's no way to know which index corresponds to which
> > > > > > > > > > TMD, as firmware
> > > > > > > > > > may return tmd-names in any order.
> > > > > > > > > > 
> > > > > > > > > > below are the changes post new thermal mapping changes:
> > > > > > > > > > DT: tmd-names = "cdsp_sw", "xyz";
> > > > > > > > > > Firmware: ["cdsp_sw", "xyz1", "xyz2",]
> > > > > > > > > > Driver registers: Only "cdsp_sw" (index 0) and "xyz" (index 1)
> > > > > > > > > 
> > > > > > > > > names property are not to instruct drivers to register or not to
> > > > > > > > > register something.
> > > > > > > > > 
> > > > > > > > > I don't understand the problem and explanation in the binding is
> > > > > > > > > basically non-existing.
> > > > > > > > > 
> > > > > > > > > Remember that all lists and indices ARE FIXED, so driver knows exactly
> > > > > > > > > which index means what.
> > > > > > > > > 
> > > > > > > > 
> > > > > > > > thanks for review, shall i use driver data, which is basically
> > > > > > > > pas data structure like below:
> > > > > > > > 
> > > > > > > > static const struct qcom_pas_data {
> > > > > > > >        .crash_reason_smem = 601,
> > > > > > > >        .firmware_name = "cdsp.mdt",
> > > > > > > >        .tmd_names = (const char *[]){"xyz", NULL},
> > > > > > > >        .num_tmds = 1,
> > > > > > > > 
> > > > > > > > Is something like above acceptable? and this will also help to
> > > > > > > > filter tmd names as well?
> > > > > > > 
> > > > > > > 
> > > > > > > How the thermal framework will bind the thermal zone with the TMD ?
> > > > > > > (node pointer, id) ?
> > > > > > > 
> > > > > > 
> > > > > > Hi Daniel,
> > > > > > 
> > > > > > thanks for review.
> > > > > > 
> > > > > > With id only, in this case instead of taking tmd names from device tree,
> > > > > > qmi_tmd will take tmd name from pas_data(driver) and register with the
> > > > > > cooling framework with id only. Please let us know if this looks fine.
> > > > > May be I'm missing something but:
> > > > > 
> > > > >    - The QMI TMD returns a list of names, not ids
> > > > >    - The QMI TMD may return the list in different order than assumed
> > > > >    - The cooling map index points to the name of the TMD in the DT
> > > > >    - This name is used to match the name in the aformentionned list
> > > > >    - The index in the list and the id in the DT can differ
> > > > 
> > > > Would it be better if we define standard indices for the standard names?
> > > > This way we decouple the actual firmware strings from the DT.
> > > 
> > > I don't think so, it seems to me too fragile and prone to error.
> > > 
> > > It is a remote proc, an external subsystem. The contract between the client
> > > and the server is the protocol. The protocol specifies the identifier as
> > > named strings, the TMD names, not numerical identifiers.
> > > 
> > > When asking for the list of TMDs, we get a list of strings. But as it is an
> > > external subsystems, may be tomorrow someone decide to send list ordered
> > > alphabetically, or per number of states, or whatever.
> > > 
> > > With hardcoded id the QMI TMD clients break
> > 
> > I was thinking about something like:
> > 
> > #define QCOM_TMD_DSP	0
> > #define QCOM_TMD_PA	1
> 
> Ah ok, it is correct if:
> 
> tmd-names = "dsp", "pa"
> 
> Or
> 
> #define QCOM_TMD_PA	0
> #define QCOM_TMD_DSP	1
> 
> tmd-names = "pa", "dsp"

I was more inclined about having the standard indices for the standard
mitigations.

BTW, I checked, which mitigations are being returned by the DSPs. Few
examples, just to provide some context.

SC8280XP, X13s:

TMD service: instance=0x01 (adsp) node=5 port=9
  1 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1

TMD service: instance=0x53 (slpi) node=9 port=9
  1 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1

TMD service: instance=0x43 (cdsp) node=10 port=8
  3 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1
    [ 1] cdsp_hw                  max_mitigation_level=1
    [ 2] cdsp_sw                  max_mitigation_level=7

SM6115, RB2:

TMD service: instance=0x00 (modem) node=0 port=20
  9 mitigation device(s):
    [ 0] pa                       max_mitigation_level=3
    [ 1] modem                    max_mitigation_level=3
    [ 2] cpuv_restriction_cold    max_mitigation_level=1
    [ 3] modem_current            max_mitigation_level=3
    [ 4] vbatt_low                max_mitigation_level=3
    [ 5] modem_skin               max_mitigation_level=3
    [ 6] modem_bw                 max_mitigation_level=5
    [ 7] wlan                     max_mitigation_level=1
    [ 8] wlan_bw                  max_mitigation_level=1

TMD service: instance=0x01 (adsp) node=5 port=8
  1 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1

TMD service: instance=0x43 (cdsp) node=10 port=8
  3 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1
    [ 1] cdsp_hw                  max_mitigation_level=1
    [ 2] cdsp_sw                  max_mitigation_level=5


SM8350, HDK:

TMD service: instance=0x00 (modem) node=0 port=22
  28 mitigation device(s):
    [ 0] pa                       max_mitigation_level=3
    [ 1] pa_fr1                   max_mitigation_level=3
    [ 2] modem                    max_mitigation_level=3
    [ 3] cpuv_restriction_cold    max_mitigation_level=1
    [ 4] modem_current            max_mitigation_level=3
    [ 5] vbatt_low                max_mitigation_level=3
    [ 6] charge_state             max_mitigation_level=3
    [ 7] modem_skin               max_mitigation_level=3
    [ 8] modem_bw                 max_mitigation_level=5
    [ 9] mmw0                     max_mitigation_level=3
    [10] mmw1                     max_mitigation_level=3
    [11] mmw2                     max_mitigation_level=3
    [12] mmw3                     max_mitigation_level=3
    [13] mmw_skin0                max_mitigation_level=3
    [14] mmw_skin1                max_mitigation_level=3
    [15] mmw_skin2                max_mitigation_level=3
    [16] mmw_skin3                max_mitigation_level=3
    [17] mmw_skin0_dsc            max_mitigation_level=15
    [18] mmw_skin1_dsc            max_mitigation_level=15
    [19] mmw_skin2_dsc            max_mitigation_level=15
    [20] mmw_skin3_dsc            max_mitigation_level=15
    [21] wlan                     max_mitigation_level=4
    [22] wlan_bw                  max_mitigation_level=1
    [23] modem_skin_lte_dsc       max_mitigation_level=255
    [24] modem_skin_nr_dsc        max_mitigation_level=255
    [25] pa_dsc                   max_mitigation_level=255
    [26] pa_fr1_dsc               max_mitigation_level=255
    [27] cpr_cold                 max_mitigation_level=3

TMD service: instance=0x01 (adsp) node=5 port=9
  1 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1

TMD service: instance=0x43 (cdsp) node=10 port=9
  3 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1
    [ 1] cdsp_hw                  max_mitigation_level=1
    [ 2] cdsp_sw                  max_mitigation_level=7

SM8150, HDK:

TMD service: instance=0x00 (modem) node=0 port=21
  6 mitigation device(s):
    [ 0] pa                       max_mitigation_level=3
    [ 1] modem                    max_mitigation_level=3
    [ 2] cpuv_restriction_cold    max_mitigation_level=1
    [ 3] modem_current            max_mitigation_level=3
    [ 4] vbatt_low                max_mitigation_level=3
    [ 5] modem_skin               max_mitigation_level=3

TMD service: instance=0x01 node=5 port=8
  1 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1

TMD service: instance=0x53 node=9 port=8
  1 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1

TMD service: instance=0x43 (cdsp) node=10 port=8
  1 mitigation device(s):
    [ 0] cpuv_restriction_cold    max_mitigation_level=1


-- 
With best wishes
Dmitry
