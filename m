Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B93544E67A
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784918515; cv=none; b=dx5fhsiesfph9L102E4Rlxci0+kIeTRWJvwRjVvlc6A0FUth4+2t2jsZNz3lT6GdSi7dcTjimHU6AF6Bt28iUt2FbthIrDA3zZkGjMoGa46HkjKnGAxf7AIijwpotNJXEB/ihCJsEhn4d9v3ZbLOZ10+byTo8oGI/1nh0kkRsG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784918515; c=relaxed/simple;
	bh=qNZvK7+AlNN2rB1roG+QzHztK+rI+mX+6qlTqpAyUSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MYPo5v7t63bK6AmkLwQ8Z1dFSCkYJrBkZ1/rLeCQNv5e393S7OlSvwKP47JGYEeQOIr6lkvHoSj5xqs2A/tByRdCTU50K+gBUpzMBl6pv83U/cJ9C9XZ2xsndrusWQv0tg//se9kdc/dQ/tD2b2NouZYMq8gLfkn9ZUPVlVzHUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNu8HQQA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ckRk2eti; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNu8HQQA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ckRk2eti"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqrcu3793999
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7o4JihoclNc
	NdJZNe0ixXAAbiKqntyluapfzy3jSsTs=; b=bNu8HQQA9zdcauZol1AcpFm/tW1
	r8rvsJTazUbRV+po27H/CEkb2FcawQ7vhFc5p10O1WqMMhGpf3PHzNPz/4GMA6cK
	7zMsV56Lvvn8twfoxGhHd3htRTuV7RfBrN/DOVIizuinipXFlc/ebUIfXU68g6pT
	xlwPCdMYJAGWUpr5HrpfIoKlcmCoR0u6sovfCpOZxprwZ+dbC2IgMXcueFyxdP1t
	4P7aBC6s4JqHmhnr+Zp+MPS23Omu10SrJkCnawCj4Tr9Z4S0kHOAq9UVbTn77gme
	66czs+XGjXF9NS94Qr5qxd2Xa7DGpkfHP3X3dBnzIgeUYAUELTUhqokYKXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf19wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 18:41:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so798915a12.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 24 Jul 2026 11:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784918513; x=1785523313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7o4JihoclNcNdJZNe0ixXAAbiKqntyluapfzy3jSsTs=;
        b=ckRk2etiK4GSdvmXXikpk/UP4gXFiSwfo0ST2NB42kLp+U70pwPF0Lu8Vu9+2pwcxl
         VJckcb9Hl8GnTNkExoapZhcu58YZzyKbrFTF1JVpDwvww7oripD+3Eut2RRBIGqKw0Vk
         ANWyj/tigmubTMJz7gIOJaq0Ja5qlor3vMDBTsroI9nzU3Q1JBr1cM5H48tI5ean/0Xw
         hX14sSU099ySMs7iAt6AR/KCAWv8ZEvfP0Ur0SCDwPeT7lcm+By2l0iHVe5a3AzSR0gr
         2v3DynjsAtxEyQ+CMtj8XaFc7wlGqgUHrVhw3/H8UgWBLupiAXxL/qHgSkZmeRVOiTKB
         CCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784918513; x=1785523313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7o4JihoclNcNdJZNe0ixXAAbiKqntyluapfzy3jSsTs=;
        b=Gm66n3BzzJ5YGBCXQbNayyYCMIYrIUvbkKaefkZs+mz7YdJgTz1Ny5heCmuiu4KAfR
         m4daPIZZkl1JV3sLMyb7ffd1K7oZTZva6ZTzJ6n6ebmfVg3VLm5xN9nTgX4okpieseRN
         z+h+YPqJPgTCtsnQ4dmiZUmoUz+3uq4WV0MV76wA1tH1VpdiZxYcjIl6jm92168izAt1
         2sR/JX4Rhoo1QhOrKfjMR6Tr4qwxSZn9TZJEjH1sloN1AjjLdLAweggt3O1D19rylXCO
         qQLXN5RJeeUqJYP1rhHH7TmJ0Iswbn3EFfNfUBAxgNZd6dwV5iemr/QrL0Hyi8Wuj5SG
         ze9A==
X-Forwarded-Encrypted: i=1; AHgh+RrZcN698QJhylWhchBd7hV15UtQfyyJQWAeYDEX9dbvCFnPbfm5MpqoUGnyP84SEoz/VBgb/9hh/u2/I4ByROAw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/eza2SP+G7uY4XneptttwPMWB2nNwmlfc4t111P3u5iCSxiBP
	Lhfr8dV3h75srwy4s5jLL/oQthFr4rwBp9JElfZtyaIE0SUsuArlK2VUz/k+PiNFtP3pLgB/aT4
	VU/nv+r4kUicMUYT+uHsTT0m+BELbdARiYlqcbuJ151tXk3HQy3prTyZGVJL4y1xui0ZnoqMP
X-Gm-Gg: AR+sD120x0e7gOSUICTuqucWC5wbDa3J1v39RSs+7PUD0BOpzf5VPxMC7N6ehYxpm2m
	djXRkfSGOcUaHnvlUk2pZTWc6ej1JAHq8VWKPqfCofzsU56V0q6tKyl4mjTXEe/EajjfRzLRqid
	ikg3Kxoykh1zJBLuV5SFqfc761y/nNoGcGkhQJh3mWfMMp1+rTX6aAWjsHWf1O0p+hWAkMJnd3t
	jmOxWAql0GfM9HotvkHGsb2qkWALTJ1ugmnJuTiJ8SJaEuXI2H/5EcJlGvhvxrCtt+rjL9Ih+NL
	RZT/2BIjklGuUMKneXkK7+r3fi87j1/ZXUe8l95yJhu/2LMTwCjBJLjxcKbubCPzxixjI29vYdm
	Tg2pTknKcRUQmy0vW5uz3RcLcNWo=
X-Received: by 2002:a05:6a20:2d28:b0:3b4:81b4:9b79 with SMTP id adf61e73a8af0-3c44b18d9cbmr10519005637.40.1784918512861;
        Fri, 24 Jul 2026 11:41:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:2d28:b0:3b4:81b4:9b79 with SMTP id adf61e73a8af0-3c44b18d9cbmr10518978637.40.1784918512352;
        Fri, 24 Jul 2026 11:41:52 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5cb670sm2222283eec.31.2026.07.24.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 11:41:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 5/5] remoteproc: fix OOB read via signed offset in rsc_table_for_each_entry()
Date: Sat, 25 Jul 2026 00:11:32 +0530
Message-ID: <20260724184132.1878077-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com>
References: <20260724184132.1878077-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfXyZrc1UYJ+QsQ
 dP3kqo5LIHnHVeRDXzXGbLSvimHV8nN7gl2RCO6zPYU+ovV+1S6bx+9B56aXlnugd0OyFZAoWfx
 2NzIilavu0XZ+hmzYen2wq0thbWOWb8=
X-Proofpoint-GUID: cBw3_NKwMEF5fwuVRY3vBUyb1f-NnJS4
X-Proofpoint-ORIG-GUID: cBw3_NKwMEF5fwuVRY3vBUyb1f-NnJS4
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a63b1f1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_5PO8_XNLmbmSLjM89cA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE2OCBTYWx0ZWRfX9EjGMFMoM+Ge
 O3teETSmFNPZp0HoLrUcjPKxxsmi0jXVVQ3COHGCnoKu1R3ZInq3Jyj/VRiVPfn3ZRTpO+UBJNy
 0TzkInCZcWi5RcPUjGBDxPKRLKb+Af4OMNYbgdF5ICdUPWJTDwtdC1twHKg6430indIwUAbXzRy
 /wk4MBSWbWXT//kAZcZLToFJnJkrKpNwO4aSEjjMMmfMe6//B66dEMAcWlCI0BQMpzY+HpqatB2
 iymFwUO/U49GvNtpu7IoSC5O26bnkJ1fYUkUl5McOw41mm4KQUZQGckdkBrsXrDPuc73HN/7CJL
 4BuPz1ZweiBoAtsBMFiahqD+FmUz7XVT1Q7GW47yCBxGAlCeKCyRFbzeBN1HCTibTh1+l9S7NA+
 fVoDTB8EdiXbAP3m1BBV3qkRzhdMoGAdT6cN0drKQo4MqT1Vn1sOnKiCNiITDZ0NrHolDXEvP+s
 F7o6GSIC4zuBvQlMY9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240168

table->offset[i] is a u32 from firmware, but was stored into a signed
int.  A crafted offset like 0xFFFFFFF0 becomes -16, placing hdr 16 bytes
before the table buffer.  The subsequent avail check was bypassed
because the negative int was promoted to a large size_t in the
expression "table_sz - offset - sizeof(*hdr)", yielding a large positive
avail and letting the out-of-bounds hdr->type read proceed undetected.

Store the offset as u32 and validate it with unsigned comparisons before
any pointer arithmetic.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 include/linux/rsc_table.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
index b78c4760d83e..f9c5628e16cd 100644
--- a/include/linux/rsc_table.h
+++ b/include/linux/rsc_table.h
@@ -338,17 +338,22 @@ static inline int rsc_table_for_each_entry(struct resource_table *table,
 	int i, ret;
 
 	for (i = 0; i < table->num; i++) {
-		int offset = table->offset[i];
-		struct fw_rsc_hdr *hdr = (void *)table + offset;
-		int avail = table_sz - offset - sizeof(*hdr);
-		int rsc_offset = offset + sizeof(*hdr);
-		void *rsc = (void *)hdr + sizeof(*hdr);
+		u32 offset = table->offset[i];
+		struct fw_rsc_hdr *hdr;
+		int avail, rsc_offset;
+		void *rsc;
 
-		if (avail < 0) {
+		if (offset < sizeof(*table) || offset >= table_sz ||
+		    table_sz - offset < sizeof(*hdr)) {
 			dev_err(dev, "rsc table is truncated\n");
 			return -EINVAL;
 		}
 
+		hdr = (void *)table + offset;
+		avail = table_sz - offset - sizeof(*hdr);
+		rsc_offset = offset + sizeof(*hdr);
+		rsc = (void *)hdr + sizeof(*hdr);
+
 		ret = cb(hdr->type, rsc, rsc_offset, avail, data);
 		if (ret)
 			return ret;
-- 
2.53.0

