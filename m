Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930E816FF25;
	Tue, 17 Sep 2024 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726569915; cv=fail; b=Wm2K0GcQkIaW/RZOPEaosPCpnuLtjTkaNxg7hsv92ubUyY9n/fezFlmVfnKdENCtd7UAjKj5zig1WA6F/SgR/cJjnD0u7y8TSaxbAkiQBsRj60fKkXitZnDv/esXC9GwtNMoeOFMsgh6nZp79OjHnS7boQfL/QWYwwEcG7vWzRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726569915; c=relaxed/simple;
	bh=ooGzDki+jVq48L8lg1KICryyiZqMMz65rmPdUqEE2B8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a0HIVJFPs9ew8ls1puWUbHfL+y2b72x3PDeH2//KKmZo+gCAW2q2CRoqcdBvOTCPoC/NnhFjpVj3nGfiuSdhACYgDnWUdzIEHeGM0xI6kYA8BS5itlYxZazdchue9DHHGVE+1eSfF//e229FLfmKwXQBwq/PSdbjZyJ761awumk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=epBZAfW2; arc=fail smtp.client-ip=40.107.237.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="epBZAfW2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xox4pP6O165HVgM6z2/d0lVt59saxhHwn06an0Jsie1v51j75dUmsl1R2uBPZZVuEfMp3O2S6BWTF+MYIF6ekba1kqIkLXja6PASXgiOunizssWDWv8BOhpj4sNEL7PSzLJTPjWw0AAoqCvF2elQNr6+JqWOSB1xSO3bMC4Y0jqr2sjxlLiHqCeBWVdMRhwQw11UhcfbUpgqvB148bHFmrF6fnQpvKMpo0ZDPrd5UNraDLYEuKQqATpLRen/Z+IWyXDlhUmZx+s0XNJq4UIi5eaVsrmCUeomvzqCRTxEJZKtD6DiQ6bIhuaCV0+bb3e40KlzbJJ2PqV1+kHwkgq8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ooGzDki+jVq48L8lg1KICryyiZqMMz65rmPdUqEE2B8=;
 b=xTgwZ9R4EEjMa0gXzE6rE7K3yPsgEmd9z7Ym0oXba64p7+yu2JQgeqa+Iaq6olk5d3QAuzVKuJar1FoCCqbfqowtEVjPWL/XwnLV4RCuxwA91ajQ6pbsgOMPunHoBsqGdLvSPH9XEzB+g+K6nIJls48EDTDWd75EvRuoPiTdyqNhub2FkbSy5oIg41XEEZkDgj8oObAvyhINqW63bBaWnVmoaMW79WU9mQqcLWOzSIrXt6i0Mr0DTHc9NRg8ZWpqzRoyg5XmIDJKODdUhQZ79mf1Hj240BtgqvkuJAqDdJziEaLRpzmYuRSjCrBHxBA+Ay0oB2Axcfr5PvUFo3cOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ooGzDki+jVq48L8lg1KICryyiZqMMz65rmPdUqEE2B8=;
 b=epBZAfW2kl9lgsWriwQZRp2W+uOxG+PmQUj5HMhBa5ohliniv7mKwV1FCFsbSbfROswTRQmoZ5qXcvOTWLbxEKK3twRWuMOwd0xJrjnK++14kks/KTn8CiouNMFpsgtFTqVAG3O6NRQjVQwV3fR7xbkGVmm25T8v/oSZPthZUMasVXNeJvdJI5qaR/UHqbX4ELIoxvNM1VWlU/zXn1nHsvGk+h1rbB5FiG9boi/TTgyF2Db6dnZVgPPiiTIF92BEkAFGg/T4pqF8fvxr3sCGwGTf5xYfdUtcpNrvCMVIh5wg7/No8eRJ7vW6piFz0/BVlerHroNK8DkHo+p1trSu/w==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 10:45:09 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::f0f:4a3f:e3a3:d3ad%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 10:45:02 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <ganboing@gmail.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<Conor.Dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
Thread-Topic: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
Thread-Index: AQHbBTOFSofdKPW8iUaglwnrisKEh7JbBPgAgADN7IA=
Date: Tue, 17 Sep 2024 10:45:02 +0000
Message-ID: <1f269bea-ad97-424a-97cb-970194dd54a8@microchip.com>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
 <fe87c66d-e5f6-46bd-828a-6fac2b0aa0ac@gmail.com>
In-Reply-To: <fe87c66d-e5f6-46bd-828a-6fac2b0aa0ac@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|SA2PR11MB4794:EE_
x-ms-office365-filtering-correlation-id: f99c3b19-4c23-4240-6557-08dcd705c8e4
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?dkpNTDBPTTQvcTJsQ3N6dkVnd3R5T1FURk1MRnVYYjRpYmtYYjBDUm9NNm85?=
 =?utf-8?B?WnZtZTlPMDU0VmY3QVFsdnNXa1kzZTZ0Ty91TUdUa1g4Qmx1UUJkMVpLNFZS?=
 =?utf-8?B?YVRxd3U4K3VFMkxVTVFMdXcxdTBJdFZ5OVRrZWdTUDNrQ1lsSExHeDJqSFFY?=
 =?utf-8?B?eWlxWnJoVW5vUTczcExUYlkxczBvS0FJTjliR2g5dXBNRjRPaVZKQzZRaXJT?=
 =?utf-8?B?RWNDaHIrR0cveVk4dTcwVEJZQTZXL29Pem9PTHcrY0xwV1VPOUtVK3pLOEoy?=
 =?utf-8?B?Q3YwVnhYZGNveXJVeVJqN3dVOTF6VnY3TlpSdXdQcGlJQWhPWTlqbFZRRXd1?=
 =?utf-8?B?TzIvNDNjRkNoZXMyVnBSZ3VXbVd1YUpuY3NqZ0JkRXQ4cGQ0VkhBeGNHaisw?=
 =?utf-8?B?NjhQVlpMc0JYQ0RORyt1OFBiUW50MlVrNDRFQnNXQVBaM0FIWHlMYXExZTBL?=
 =?utf-8?B?TTVRdUFGRGVCeUZTQkJNSmErMmlvazlVQ1ErOXNXZisxQjlPaDlLdnZWL3FO?=
 =?utf-8?B?WGtmSktRMVF2OFZXZUdKaUxacTBKMUtLU0dVRTQ0WDBVZk53T2l1MkdsSHZT?=
 =?utf-8?B?eVVNVndkYmtDblo3MExQYU5oNHJ2bVU3OUk0WnNCQ2kzQ2JKNVpxMERQbVVl?=
 =?utf-8?B?WWNIdG5rUGwxclgvQ2U4SWtrb3NLR1IwSnl2MHlUOGR2R2JiZE4xdFoxUTBy?=
 =?utf-8?B?ZDRkb1pnOWhwblVDc0V4NnNoZDRrKzJ0KzhVaUZvaFVpYzNYL092OU11S2d6?=
 =?utf-8?B?dmI1Tng4Z0FYUUw1WjFRRENjYTVMZDYxU2NETXlTazJOajRWRmdnRXJtRmE1?=
 =?utf-8?B?WXRFaEhNajFIMWtpMFlDWmNIYmxyREd1RkhISnE1MEdoZnlhaXNrYnJwaEtP?=
 =?utf-8?B?RDdFNm1ka0VBU2dWcEx1c2JOVU9DRFJEVzgxTjhLdFVBWGJhOG41ZkwxQ3Nz?=
 =?utf-8?B?RmRJTitmWVYzVy9McXh3UTJqZzVsUVB5T2JHVDBjVU1VTlFTMVFtMEZCV09R?=
 =?utf-8?B?M1dObUhwVUdmb0pzMmZKVXBQNDViQnkrcmpuTlBGL2VKbTViM2xONEQzUytN?=
 =?utf-8?B?VEQrUjF1V0Z2TXI0RlV5YWVzSm1NMzZRWHJRVFFjYy8vMzhHQlgrZ0VpMDlV?=
 =?utf-8?B?WTIrdGpwNGRVS3RwcFVMQ0lNTWw0QVhJT01QcGxMN2Ryb2lrN0FqVTNGZXBS?=
 =?utf-8?B?cDZVZkpvVVBSelUyKzJuSXBQR2JRK01URG40UVZWbkhaNElVWWZkdE1ta1Z0?=
 =?utf-8?B?S1J3UzNJc1hZZzJrK3RrNkNTVHdJc2lxaDlTaE8vcm5BaXNyUjJPbk83ZmFL?=
 =?utf-8?B?WmpSQ0o1eWVKY2ErUGowa2NpenB0NVZaZUlFWTZIN01aMTZyUTl2cm84RmVG?=
 =?utf-8?B?VElDRE1oUlpXTExNSjdwVXBIQmRSdlVNdjB3bEtJUTU0bWZXZ1ZIaFFjcVlI?=
 =?utf-8?B?UnBQVzhlWkRVK280ZDRUbUpIYUJONjdhVC8wRmxYaEJGcXc1ODFscGRKdUh0?=
 =?utf-8?B?dE9yaHpQSTI2Yi9Cdlo2ZnV5dkNaNDJBZmp6WDlYY2Zaa2sweGtQQ3piRVB4?=
 =?utf-8?B?QmUzVEFmQjk0VnBXbElzdVVXa1dvK3dZRDV0V2JET0s1NURRNkVrRVhuWGtX?=
 =?utf-8?B?bUNjT0lsSEFGdGR6cEthWDJVU05acjJpM1hjalFnVTdOQjBld2dlZUY1U3hN?=
 =?utf-8?B?YTdpaUFER0pWM3pSeGRPN0R6SG9vcW9DVVpmTXdXbWRJUVFVSmRaTFpOS0dZ?=
 =?utf-8?B?OEh6d284MUlYRkh4SWdDemFldGU4cmt3RU1OUTQ1SDdyaEx0TG4ralZLUndU?=
 =?utf-8?B?aHRCMklvcjdsSENUQTIxR0RUKzRtWDVCWVYzcGYrL1U0MGt6RWpqQVYreldI?=
 =?utf-8?B?azhZUGpqYVFFclV6Q3lvREFGZ25JWThlU1VtOVdXcGZvY2VqUUV6anN1MVFP?=
 =?utf-8?Q?y/opOj7mCG4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VndBMWFrM1ZIU252TXF5QjhCU3dkWm9aRkFGLy9OK3dDRFJxd0dwdVFidWRj?=
 =?utf-8?B?NFBtK2N0cjdFKzBiSzJwTEhvVHdNS1VKTTlpc0FIakdlSUJWRGoyTzcyQlZi?=
 =?utf-8?B?Nlh5SjZ0VUxCblZSejBneDU1eFE1Wmt0N2M4Qytyb0daL1NOVmtkVDBVdEt4?=
 =?utf-8?B?MkUwQ25LbnNDeG41YThudkdkVFM2UHU4b2Y5cVVCMXRUMlJOSTdLamxGRGNQ?=
 =?utf-8?B?dXh5ZVpuRkoyYUNNOCtDaFl0em03VXp3MHRyMVB3T0g1SzM1REVQVkhtWkpW?=
 =?utf-8?B?Umt4bU80by94M1lPUEZQNnI0QktHTDNPdWprM1FxVlpoY2Z0VkIxK01sdE11?=
 =?utf-8?B?K1Y2Uzh5QWU3RWRRY1A5b0E4czMwd2ZIL0JORzNuMGFGUll0SmMySC9BaHQ1?=
 =?utf-8?B?NmVLRmxwcG5xN2J6bmJ5ekpZWnBrWFJBSDBjWTBBZ1hSUFFqeWdqLy9JTnpK?=
 =?utf-8?B?WTBxMGdUWjJqOGVPbEVGQ2l0M0p0MUw4RFh2cnJZZmdkYXVib2w1OVFsRGs4?=
 =?utf-8?B?ejJTNmQzOFVlczFJVmY4aUtYbVRUYW1hd3VoYzI2QVV2WTBuRFJLK0FoUDFm?=
 =?utf-8?B?Ly9LNzN4cU55OEJKU01HN3F4SUxxR2JTSTRhWnB4cXVnOW5KSitpaUtlWGY1?=
 =?utf-8?B?bmg4Y0tseXJRYWFNbCtMZTJwTUwyMkVublRVUDBaMWp5WWlCZDhaZnZ5QVhG?=
 =?utf-8?B?dkQvbUMzcC8wb0Y4UEY1ZjVqbm1TZ2ZTRHA2b043eFZId3VBMmUweW5ZOWNY?=
 =?utf-8?B?Qzl1K2ZaV0gzRTkvYTlOMTlpbmNaOTc0ZnlMYityQ3F0OVBKa0swaEdTNnVN?=
 =?utf-8?B?dWRpT2JzYnprcllQV2ZtYkN5dHJhSkRIQnExTDk5ajhJWDAzVVZlbjVaNkRM?=
 =?utf-8?B?Ni9jZHN2bVdINlFTQ0NxbWdsdkhCRzMyVUpzUEpKdy9qL0ZIdHE3K0ZWZVVY?=
 =?utf-8?B?UlJWYWZxN3IzUG1BVW1vd3pBQmJHZ0x2dXEwdGh0ejRzaTZXVURpdVJjNTZV?=
 =?utf-8?B?cFRBa3p0RXNHYWRyN1F5RHA5bnZoeDRSSXh6RWlxajJrbW9uQVNweVhOczZX?=
 =?utf-8?B?alNKTER4b2JkWFJPQkJQYUZxWEZwSVAyRk5oRVlpMnZjRTdBcUw1MWlibTNa?=
 =?utf-8?B?bHdiampJK05ETnZYbUVna1pNOGg1Vmo5MlNJcUhMaW5YV0RoN1grRzZWdlVs?=
 =?utf-8?B?TjRhNVpDNDFFSkc4MXpQcUlvL1dzNGFwUmlLY3Bxb2wxajFEckFCRzk4OEhk?=
 =?utf-8?B?RjFPVWg1ZlFKU3F1NytNQnVoaURzaFdSL3ZsclhpVXA3dUk5OWVkZzhONDhk?=
 =?utf-8?B?UU5JWk1ndi85bEJNY1V4TDVlY3A4eTZkeDB3c3N5Z2ludVZZSExsMTNDOS84?=
 =?utf-8?B?bk1MRW9VUUNoQU9iT2dkYy9wTlBhS05nY1BLYXNsT29GNmV0SnM2UEtXMm9l?=
 =?utf-8?B?U21oWWFjc0t3ZUJOYWppTGtyVGk1K3NUTUZIcVRRV3FSSTVWc1NmNmVnQ2lZ?=
 =?utf-8?B?b2xNazZFdk5sZlBmRzZMc2VxQlFOVmwraXlndHBaaGNnYmUxOHljWUlzVURn?=
 =?utf-8?B?RG9lWmZ5QTc1WHJkb0IxYzNqdjM1TTJGY1VPelRheVNoRjVJaTRhSGQzRGNQ?=
 =?utf-8?B?UXVUampteXhFVjd3NnU1d2svMVYvbTZPYy9NTFYyVWczZHdrTVdReVNaamhr?=
 =?utf-8?B?dzlVMFpLQUN2QWcyNjIzK1UxZzBzRTFBWDJwdld5dnFvTXh4NFdXdzE1RllG?=
 =?utf-8?B?KzhSTGlzZnVNMnB4eTdvSEs3QW55VUIrZWZRRHNNSFZLRzlMc3dWYTFYalRm?=
 =?utf-8?B?Wks3V3Q1ZVM2a1RpWkZGVW9QL3YzaGJXWkQ0NkE0bkNJWW5jYnEvQTRrSUNu?=
 =?utf-8?B?c1gzcnphU3JlQmVSS29CTXQ5OEFyK0xOMzZBT003cnk0QjdFRXBPcEdmQ3JZ?=
 =?utf-8?B?MForajUwVUpXSll1ZjBOQmIwSGYvaVBUbkxiejJ3Z3FXeG0rQWpPbThzbEJL?=
 =?utf-8?B?RGFyY3FlaWJhd3FMaXQ1dVZCNXVrb2t2enZtdEVmM3Y5VjI0ZkpSdmxHNmU4?=
 =?utf-8?B?eVRHTGpXRU84bWNnMGRBQWQyd083WDRsWWo5S2hOVXo5MUJ5R0VEUzNOaVVM?=
 =?utf-8?B?d3k4R1hqOUxsZ1lQVE4ycHZ6dFh4ekhydEZWOVNWa1ZPbUJBV05CQVhhbHJG?=
 =?utf-8?Q?Qlq7uX3CL5fJ6ELUp/1vn14=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <052A7F2A1AC7DE45A81F7D9BCE5048DD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f99c3b19-4c23-4240-6557-08dcd705c8e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 10:45:02.4492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H5PZuFMf4cuq3pkaqF3Tgyka2jSypOhvAS53Ph2ApJUZBwOvfk9FC/+VpKxBkN3I84VDO3M5Ij15xjD2zu7HP0Y8jUzZqghdbaxWU/LwCbEEPMmT7FKHyx/854/aZ9+B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794

T24gMTYvMDkvMjAyNCAyMzoyOCwgQm8gR2FuIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IA0KPiB0
aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaSBWYWxlbnRpbmEsDQpIaSBCbywNCj4gDQo+IE9u
IDkvMTIvMjQgMTA6MDAsIFZhbGVudGluYSBGZXJuYW5kZXogd3JvdGU6DQo+PiBBZGRpdGlvbmFs
IGRldGFpbHMgb24gdGhlIE1pY3JvY2hpcCB2ZW5kb3IgZXh0ZW5zaW9uIGFuZCB0aGUgSVBDDQo+
PiBmdW5jdGlvbiBJRHMgZGVzY3JpYmVkIGluIHRoZSBkcml2ZXIgY2FuIGJlIGZvdW5kIGluIHRo
ZSBmb2xsb3dpbmcNCj4+IGRvY3VtZW50YXRpb246DQo+Pg0KPj4gaHR0cHM6Ly9naXRodWIuY29t
L2xpbnV4NG1pY3JvY2hpcC9taWNyb2NoaXAtc2JpLWVjYWxsLWV4dGVuc2lvbg0KPj4NCj4+IFRo
ZSBJUEMgcmVtb3RlcHJvYyBwbGF0Zm9ybSBkcml2ZXIgYWxsb3dzIGZvciBzdGFydGluZyBhbmQg
c3RvcHBpbmcNCj4+IGZpcm13YXJlIG9uIHRoZSByZW1vdGUgY2x1c3RlcihzKSBhbmQgZmFjaWxp
dGF0ZXMgUlBNc2cgY29tbXVuaWNhdGlvbi4NCj4+IFRoZSByZW1vdGVwcm9jIGF0dGFjaC9kZXRh
Y2ggb3BlcmF0aW9ucyBhcmUgYWxzbyBzdXBwb3J0ZWQgZm9yIHVzZSBjYXNlcw0KPj4gd2hlcmUg
dGhlIGZpcm13YXJlIGlzIGxvYWRlZCBieSB0aGUgSGFydCBTb2Z0d2FyZSBTZXJ2aWNlcw0KPj4g
KHplcm8tc3RhZ2UgYm9vdGxvYWRlcikgYmVmb3JlIExpbnV4IGJvb3RzLg0KPiANCj4gV291bGQg
eW91IG1pbmQgaGVscCBjbGFyaWZ5aW5nIHRoZSBuZWVkIGZvciBTQklfRVhUX1JQUk9DX1NUQVRF
L1NUT1AvLi4uPw0KU3VyZSwgSSBwcm92aWRlZCBhIGRldGFpbGVkIGV4cGxhbmF0aW9uIGJlbG93
Lg0KPiBJZiBJJ20gbm90IG1pc3Rha2VuLCB0aGUgSFcgeW91IGFyZSB0YXJnZXRpbmcgaXMgZGVz
Y3JpYmVkIGluDQo+IGh0dHBzOi8vd3cxLm1pY3JvY2hpcC5jb20vZG93bmxvYWRzL2FlbURvY3Vt
ZW50cy9kb2N1bWVudHMvTVBVNjQvIA0KPiBQcm9kdWN0RG9jdW1lbnRzL1N1cHBvcnRpbmdDb2xs
YXRlcmFsL0FzeW1tZXRyaWNfTXVsdGktIA0KPiBQcm9jZXNzaW5nX29uX1BJQzY0R1hfV2hpdGVf
UGFwZXIucGRmDQo+ICh0eXBvIGluIHRoZSBwYWdlIDQsIFU1MSAtPiBFNTEpDQpZZXMsIHRoaXMg
aXMgdGhlIEhXIHRoYXQgdGhlc2UgZHJpdmVycyBhcmUgdGFyZ2V0ZWQgZm9yLg0KPiBJbiBTQkks
IGRvIHlvdSBwdXQgaGFydDEtMyBhbmQgaGFydDQgaW50byAyIHNlcGFyYXRlIGRvbWFpbnM/IElm
IG5vdCwNCj4gSSBkb24ndCBzZWUgd2h5IHlvdSBjYW4ndCBqdXN0IHVzZSBIU00gZXh0ZW5zaW9u
IGZyb20gU0JJIHRvIGtpY2sgcnByb2MuDQoNClRoZSBmaXJzdCBBTVAgY29udGV4dCAoaGFydHMg
MS0zKSBpcyBpbiBvbmUgT3BlblNCSSBkb21haW4uIFRoZSBzZWNvbmQgDQpBTVAgY29udGV4dCBt
YXkgb3IgbWF5IG5vdCBiZSBpbiBhbiBPcGVuU0JJIGRvbWFpbi4gVHlwaWNhbCBBTVAgdXNlIGNh
c2UgDQphcHBsaWNhdGlvbnMgaGF2ZSBMaW51eCBTTVAgaW4gb25lIEFNUCBjb250ZXh0IGFuZCBh
biBSVE9TIG9yIEJNIA0KYXBwbGljYXRpb24gcnVubmluZyBpbiB0aGUgb3RoZXIgY29udGV4dC4N
Cg0KQk0vUlRPUyBhcHBsaWNhdGlvbnMgcnVubmluZyBpbiBtLW1vZGUgd29uJ3QgaGF2ZSBPcGVu
U0JJLCB3aGljaCBtZWFucyANCnRoZXkgbWF5IG5vdCBuZWNlc3NhcmlseSBoYXZlIGFuIEhTTS4g
SG93ZXZlciwgaWYgdGhlIEJNL1JUT1MgaXMgcnVubmluZyANCmluIHMtbW9kZSwgdGhlbiB3ZSBk
byByZWdpc3RlciB0aGVtIGluIGFub3RoZXIgT3BlblNCSSBkb21haW4uDQoNCldlIHVzZSB0aGUg
U0JJX0VYVF9SUFJPQ19TVEFSVCBhbmQgU0JJX0VYVF9SUFJPQ19TVE9QIGZ1bmN0aW9ucyB0byAN
CmhhbmRsZSBib3RoIHNjZW5hcmlvcy4NCg0KPiBBbHNvLCBob3cgc3RhYmxlIGlzIHRoaXMgbWlj
cm9jaGlwLXNiaS1lY2FsbC1leHRlbnNpb24/IElzIGl0IHN1YmplY3QNCj4gdG8gY2hhbmdlcyBk
b3duIHRoZSByb2FkPw0KDQpBbGwgdGhlIEZJRHMgZGVzY3JpYmVkIGluIHRoZSBtaWNyb2NoaXAt
c2JpLWVjYWxsLWV4dGVuc2lvbiByZXBvc2l0b3J5IA0KYXJlIHN0YWJsZSBhbmQgYWdyZWVkIHVw
b24gYmV0d2VlbiBkaWZmZXJlbnQgYnVzaW5lc3MgdW5pdHMgd2l0aGluIA0KTWljcm9jaGlwLCBz
byB0aGV5IHdpbGwgbm90IGNoYW5nZS4gVGhlcmUgbWlnaHQgYmUgYWRkaXRpb25hbCBGSURzIGFk
ZGVkIA0KaW4gdGhlIGZ1dHVyZSB0byBleHRlbmQgZnVuY3Rpb25hbGl0eSBpZiBldmVyIG5lZWRl
ZCwgYnV0IHdlIHdvbid0IA0KY2hhbmdlIGV4aXN0aW5nIEZJRHMuDQpJIGRvbid0IHNlZSBhIHBy
b2JlKCkgbGlrZSBTQkkgZnVuY3Rpb24sIHNvDQo+IHRoZSBrZXJuZWwga2luZCBvZiBhc3N1bWUg
aXQgY2FuIGNhbGwgdGhvc2UgbWljcm9jaGlwIGV4dGVuc2lvbnMgd2l0aG91dA0KPiBjYXVzaW5n
IHVuaW50ZW5kZWQgZWZmZWN0cy4gVGhpcyBtZWFucyB0aG9zZSBleHRlbnNpb24gRklEcyBtdXN0
IGJlDQo+IHN0YWJsZSBhbmQgY2FuIG5vIGxvbmdlciBjaGFuZ2Ugb25jZSB0aGlzIGNvZGUgaXMg
aW4uIFBlcmhhcHMgY2hlY2tpbmctaW4NCj4gdGhlIG1pY3JvY2hpcCBTQkkgZXh0ZW5zaW9ucyB0
byBtYWpvciBTQkkgaW1wbGVtZW50YXRpb25zIHN1Y2ggYXMgb3BlblNCSQ0KPiBmaXJzdCB3b3Vs
ZCBiZSBiZXR0ZXI/DQpBcmUgeW91IHJlZmVycmluZyB0byB0aGUgcmVtb3RlcHJvYyBkcml2ZXI/
IElmIHRoYXQncyB0aGUgY2FzZSwgdGhlbiANCnllcywgSSBiZWxpZXZlIHdlIHNob3VsZCBjYWxs
IA0Kc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX01JQ1JPQ0hJUF9URUNITk9MT0dZKSB3aXRo
aW4gdGhlIHByb2JlIA0KZnVuY3Rpb24uIEkgd2lsbCBsb29rIGludG8gdGhpcyBmb3IgdjIuDQoN
ClRoYW5rcywNClZhbGVudGluYQ0KPiANCj4gQm8NCg0K
