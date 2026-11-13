Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.78.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594397;
	b=pYHFHxzL5OnwhnCmJVOwLVwwN53DAOTqpNwpL1PxBtvnG5uuRtbSfX+bBCvIwCGDpkrS
	 z8w+R9RveqeO6WKRxPwekLNzLVw6ev5nxRE8O6mZTS9vzU+TpJ8wABICdNIzqCe8K3iGH
	 bXzw0bZswiIS/2HXeT5eI63hiwkDgG8KngegFC3pwkT459BnOoX6XVpe12O2kWDnqNaCh
	 9tFiqpeELyR97zZzfsMTdY4DgC2V0ml334p2SMk34LHiQZUasgGIg38NLslnxO5ZbJzcC
	 nIfrxz8khvVzLKd5Qj8PfR/ioSpBVwn8YlG7PCA19asNx9S897VpAWJZXVWJ5frCM+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594397;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Info-Out:X-JNJ;
	bh=dI9CrGLsTqSXRz033vXozfBoNgpgi99PpoTMTGjh9Vo=;
	b=P8OxpzR3l8zoout9Dn0xJtJJk3/OtSXfr9iJQtd4FWiwLGRxQ/OtoKdm8QXYK8vUe0X+
	 u3O5woSt0ow96E4RU0nf9J98vxeOtcPYlCzMPzOsLb1OE481Ijw/QQWCFAXxl7zNpmKCj
	 O+TkL8p+YZ5x/fYd3qPzaPOfNS39NL1QkrJmQY6yocyWhz5rpqSWLe0dXL2rahZGD+Sgy
	 95GHdbDA2UTi7N4o2z2NK2WAIH2ax1iFTuGYz4NKh/oDyq64Iuj66b0KWh8Y1WfL6LdeK
	 DRxmFvsCkVs8Q+iiLgXWyFxFBIfctJwXiobIOOe+uD4JrYmLECv+BCsBN7Hv3i43ERg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tawheed.cc;
	spf=pass smtp.mailfrom=tawheed.cc;
	dkim=pass header.d=tawheed.cc header.i=@tawheed.cc header.a=rsa-sha256 header.s=sig1 header.b=mahuntdM;
	arc=none smtp.remote-ip=57.103.78.25
Received: from outbound.st.icloud.com (st-2002e-snip4-2.eps.apple.com [57.103.78.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408C606C144
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Nov 2026 18:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6408C606C144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tawheed.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tawheed.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tawheed.cc header.i=@tawheed.cc header.a=rsa-sha256 header.s=sig1 header.b=mahuntdM
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-0 (Postfix) with ESMTPS id F30F618001EE;
	Fri, 13 Nov 2026 18:26:32 +0000 (UTC)
X-ICL-RepId: 01a1d629-4b2f-7b9e-b69a-293cfbdd438f
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tawheed.cc; s=sig1; t=1794594396; x=1826130396; bh=dI9CrGLsTqSXRz033vXozfBoNgpgi99PpoTMTGjh9Vo=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=mahuntdMmfpuw3bFEZi9OFd0mKNYKGjHh7Q8gnaFNpaui5MCiJf+cjsWiGN7mbf6m3IU8UKImkaCpHAzbEKd1wkRVnHvali9+5PA7glkMuJajF4HnJam2VryL/MJ7zTsAsZyl3mW3aIbRV/++ny3b9HMZgilH/N+dNlaDacwjXrWG2Pc/zrYuHcDFuFRY2ErvElf69KniALMqz4XZZfPzTbtkamQwryGWewb1iwbt58Xs4gf+x0GGd9WwogH4exK8IhFGMMnqUM+cMBRE5k4DazlWR/rJ7YOitRtRATJsuEoB50ed2ijzmbrYOcUiAtYhs1HYHNtpATO2MBORv2ctg==
mail-alias-created-date: 1711150425226
Received: from DESKTOP-HUABEFD.localdomain (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-0 (Postfix) with ESMTPSA id 8937D180078F;
	Fri, 13 Nov 2026 18:26:31 +0000 (UTC)
From: Tawheed Makhdoomi <_@tawheed.cc>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8180x: Add SLPI remoteproc node
Date: Fri, 13 Nov 2026 13:26:26 -0500
Message-ID: <20261113182627.471-1-_@tawheed.cc>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104080200.135431-1-val@packett.cool>
References: <20261104080200.135431-1-val@packett.cool>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mGp5AN0oL4jc5qfSJDfMafTZIJoIqxTt
X-Proofpoint-GUID: mGp5AN0oL4jc5qfSJDfMafTZIJoIqxTt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfXymTOOyKhiqpU
 vPioYShANhJ5AGc2fwQU+Y3n6piF87jXdkbAPivPc3RB74UoZZBqFiIioKBUtvClvmlZoYWoWgy
 qoIz8uSmLxlBzfw5WObgCyTBBXhp3yI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MyBTYWx0ZWRfXyquMNojkEPHd
 AgXqQYajxQkP27DNes6qa7jTG1dGs9nxzSgot9o5FMt1IVf6nUJ2fokky1uqNidkL7eMVu2Vb3x
 1nNVFtj1CEfl2qnaQ8xV0tXFtQrlnfUqo/B2aRJ0goOKBognZjCgql6h7blRlO3EAcNAfeRuwV1
 kMXeaLp+Xp9fCGgLaiPMqVl9WNEj33iVsSU1C+X//oekj3k2/JjNYpyh5+PUiHs9N1y0Ha0lE/L
 IFBf8OfspM1FTGf9luOt08d+R+IzqvF/XssgdsyYT1/pDbHsMd6GZtBx7LDUj6O5HYgAAYQzE97
 SxyQTLINul41IfLUdN8Fh6TskIu7GDzVJO1ik2x3uEcxK+N3gFJGcz79AFXXkw=
X-Authority-Info-Out: v=2.4 cv=L/WI0OT8 c=1 sm=1 tr=0 ts=6af7565a
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HxOO8S7qDNDRVQTpMkN7:22
 a=xMDwETJtoVPTnyRVXtnQ:22 a=OXmT9jt3cf_crHWiQK8A:9
X-JNJ: AAAAAAAB+510s+9+VnB+PpZXfRy9ykg2Jb27Jg6ffRKiZGzEp0f+VK8PyuC0W/2On3OSIy
 4W5FaqvWhfY+iL4NFIl6UDl9KIWuW8QJcm/QMgJU+PaZwy9msLoVh+RZ11I65lrjA2hnPz
 Zx0KOpI12PQoCYdZ5mEWjckQmS4oPYPrxHqA+8n4VWsCVlqg7/eizIRdQ+/KzTzMGySaVe
 AWu3EyMfwD0E1YCC8ViwIVgyRBT48PVYC9KYGlaDzUKXzmpfBnv0BCp5CdOh+d+0Ln8WBN
 FYcKCXBfeRPX9YVAy0tMXcYkNmhyA0nMhy9q+r3fizxY1WjW0znqBlITgaVN5LV6CCGX1r
 oY1bW3M3Up8VLw3QMkdqmExEUJY1i3B+Znzk39r/ut/S/zOf4bIENrJbI8D8NPa+EdgIDk
 PooGfV9pyDHhmc0hjHCkaUGff3G8vMxuN+HP/p0uqihTbeMhwJyHip+s1Qg2Mbtj2VB4zu
 r26HSVoD5WAsTDYsoX1iYkiG7+3/lzWI+3uWUU1pl0rsMSJMhyLn9JNoUfPEusLXOHWAJ9
 d2WQuFg7gIBuNzmJoio/RfGtiZ81GkMGQjrYSb+dpQfcRgMBMR+ft3YibxO902wl60onKB
 6vV7AC2yHi6Z16r3WXm/8pmZdGcJ5FzoV3aUSkVhxmRpFwvJBQt0NevpYgKY2/ErhDdbpj
 BCPyLSIRQDTn151VGUFr97A+eQYqDvrlP4gCXh7BabiE/AaJD66hpPwtO3SZ+tn3DDh9f3
 poquSKtQo01hZaJC4H/kZkpaBa/TqxzH8Mpy9awsYPdOCvl4lsdUNYZGpCXgQuRBR/746w
 lmGcEepZPYh8khzaEVpCU/dxl8zqiwIJEdYLgb4iDoZt4p/Zmr7zuK4j9icIpE8F5Hk+cF
 1dnqYCG083gmTpHoitZXp6KBoX5xaJJL4fnFBIOrOh1npFms7scD76dt6yRSE5NaZcFF09
 39tTVPBBcjXtvehtY6A7FvTDy3uIgRohKmMVVZZp0Tcv3jC+1e3/XF3nv8unf3VH0Bq0kC
 iCXc6KSNz9H6qAWX/N5I0SjBmPnLSSaWYzOcvw4WvH68Jft/CWN1cZRnJB5Sy11zkzoank
 WyEJaCWWx8mGaoKxRQ4MwPeV13Scc+C8lAqMvNFpHx0i68etEx9Y8DUj+xQeCNiP7FAoqy
 D2JAmzkVpK9CLK1MyNe8vSYgNsPDnglLoshd4Hp9a4hVLppUz9PsWIj21BUi1DNdvs/Pw3
 rQXv8uNQlHP7n2YPjFEfzkfEW9JkBoDDiMHe0YjrKgDE97ULSFTz/mAsZbQdPttLdQpok3
 VpdnqYGo1YJ/S5wC/VhcSO0FIXZg==

On a Microsoft Surface Pro X SQ1 (sc8180x, "cambria"), with this patch on
top of uwu-next, the SLPI boots with the machine's own qcslpi8180.mbn and
stays up: it came up in 44 of 44 boots where the firmware was reachable,
with no crashes. I haven't exercised any sensor clients on it yet.

Tested-by: Tawheed Makhdoomi <_@tawheed.cc> # Surface Pro X SQ1 (cambria)
