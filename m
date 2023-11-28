Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="7nMyXXVl"
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B7E31BE8
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Nov 2023 00:34:50 -0800 (PST)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AS20MiU012960;
	Tue, 28 Nov 2023 09:34:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=TUhcxp90iNmOGnR+a8F/maEtB7SP7LwmiuXwmKCjM0M=; b=7n
	MyXXVlQLsBTa6mvXl1UwETMDn6P7oozTJcMDNhkXT87vNwgXJorQO0AIo+FcN8hw
	RXxTuXlcZpJgMKTm2cD1DEfAFgtel0KHc3ZsXevuE2Meznvu0fqqGgTY8M7vQo9+
	TK/fVWdtya4W7mHjheQknUlKgcoaI5UbKmjh1ygJDCv023cvPLh9Bq/fhoUa2QfY
	dpXtdu2n1DoxW+/lnIRgr4vark5kqNcCSAlstTM9nfZKO14/RYYFtrFCGet0q1yj
	/i723a5D74DwRGrOs1O2gkwyTqoxRhqXqeZjboFWohO4GRZZLICMbiSMito3GZ2D
	JSo711Y81HE2SgGx80LQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ums0rmd26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 09:34:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40CDF10002A;
	Tue, 28 Nov 2023 09:34:47 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3476F217B79;
	Tue, 28 Nov 2023 09:34:47 +0100 (CET)
Received: from [10.201.20.163] (10.201.20.163) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 28 Nov
 2023 09:34:46 +0100
Message-ID: <3f0b831b-eda0-44c4-ad1b-1d4958d90ecd@foss.st.com>
Date: Tue, 28 Nov 2023 09:34:45 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion]: Enhance virtio rpmsg bus driver buffer allocation
Content-Language: en-US
To: Divin Raj <divin.raj@arm.com>, <linux-remoteproc@vger.kernel.org>
CC: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
References: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
 <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
 <b98f58a2-6627-4e8a-9466-4f6276cfd0b3@foss.st.com>
 <66dc0fbc-0898-4597-92a4-489050cb1b1c@arm.com>
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <66dc0fbc-0898-4597-92a4-489050cb1b1c@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_07,2023-11-27_01,2023-05-22_02



On 11/24/23 17:45, Divin Raj wrote:
> Hi Arnaud,
> Please find my comments inline.
> 
> On 11/20/23 10:14 AM, Arnaud POULIQUEN wrote:
>> Hi Divin,
>>
>> On 11/17/23 23:24, Divin Raj wrote:
>>> On 10/23/23 11:44 AM, Divin Raj wrote:
>>>> Hello all,
>>>>
>>>> I am reaching out with reference to the patch discussed here: Enhanced
>>>> virtio rpmsg bus driver buffer allocation.
>>>> <https://lore.kernel.org/all/CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zGtn1Qfo3mmBqVg@mail.gmail.com/>
>>>>
>>>> I've been keenly following the developments around enhancing buffer
>>>> allocation strategies, especially those focused on dynamic buffer sizing
>>>> and the considerations for systems under varying memory constraints.This
>>>> work is highly relevant to several projects I am involved in, and I am
>>>> quite interested in its progression. May I kindly request an update on
>>>> the current phase of these initiatives? Additionally, I am eager to know
>>>> if there would be an opportunity for me to contribute to enhancing the
>>>> patch, possibly by working on improvements or assisting in verification
>>>> processes.
>>>>
>>>> Furthermore, if there are any condensed resources, summaries, or
>>>> specific threads that encapsulate recent advancements or discussions on
>>>> this topic, I would be grateful to receive directions to them.
>>>>
>>>> I appreciate everyone's dedicated efforts and invaluable contributions
>>>> to this area of development. Looking forward to the updates.
>>>>
>>>> Regards Divin
>>>>
>>> Hello Linux Community,
>>>
>>> In one of our internal projects, we encountered a challenge with RPMSG
>>> buffer allocation. Our goal is to optimize memory allocation for an
>>> out-of-tree RPMSG Ethernet device driver using virtio. This is to ensure
>>> support for packet sizes matching the standard MTU (Maximum Transmission
>>> Unit) size of 1500 bytes.
>>>
>>> To mitigate this issue, There are few possible solutions:
>>>
>>> 1. Configure buffer size and number through Kconfig.
>>> 2. Permit the firmware creator to determine the most suitable value from
>>>    the resource table.
>>> 3. Enable independent configurations on both ends. This approach would
>>> support both dynamic and fixed buffer configurations using a generic
>>> allocator.
>>>
>>> Reference:
>>>
>>> [1]:
>>> https://lore.kernel.org/all/1548949280-31794-4-git-send-email-xiaoxiang@xiaomi.com/
>>> [2]: https://lore.kernel.org/all/20190701061353.GE1263@builder/
>>>
>>>
>>> Draft Design Overview:
>>>
>>> Based on the reference patch and the discussions, we have outlined the
>>> following key points for the belw design:
>>>
>>> 1. Assure compatibility, enabling both Linux and the remote system to
>>> interchangeably transmit and receive messages, irrespective of size.
>>> 2. For systems with constrained shared memory:
>>> Systems with small, shared memory, we need to deal with a
>>> limited/optimized memory chunk. To avoid memory fragmentation, the
>>> allocator should have a pre-reserved buffer pool
>>> 3. The implementation should ensure that the remote side does not
>>> receive messages based on its allocation parameters.
>>>
>>> do you think it could make sense?
>>>
>>> High level view:
>>> +------------------+                               +------------------+
>>> |                  |                               |                  |
>>> |      Linux       |                               |      Remote      |
>>> |                  |                               |                  |
>>> |   +----------+   |       +-----------------+     |   +----------+   |
>>> |   |   RPMSG  |   | <---> | Buffer Allocator|<--->|   | RPMSG    |   |
>>> |   +----------+   |       | (Dynamic/Static)|     |   +----------+   |
>>> |                  |       +-----------------+     |                  |
>>> +------------------+                               +------------------+
>>>
>>>
>>> Detailed view:
>>>
>>>                    +-------------------------+
>>>                    |  Message Creation       |
>>>                    |  (Both Linux/Remote)    |
>>>                    +------------+------------+
>>>                                 |
>>>                                 v
>>>                    +-------------------------+
>>>                    | Determine the allocation|
>>>                    | strategy                |
>>>                    +------------+------------+
>>>                                 |
>>>                  +--------------+--------------+
>>>                  |                             |
>>> +-------------------------------+  +-------------------------------+
>>> | Dynamic allocation            |  | Static allocation             |
>>> | (Buffer allocator allocates   |  | (Pre-reserved memory          |
>>> | memory space as needed,       |  | space)                        |
>>> | based on the current          |  |                               |
>>> | message requirement )         |  |                               |
>>> +-------------------------------+  +-------------------------------+
>>
>> Do you have a proposal for dynamic allocation?
>>
>> RPMSG is based on the virtio protocol. The virtio driver in the Linux kernel
>> is responsible for allocating buffers for the virtio device on the remote
>> processor.
>>
>> In the current implementation (static allocation) the Linux
>> kernel allocates predefined buffers for the remote processor.
>>
>> How would you manage the fact that the sender allocates its own buffers and
>> references
>> them in the vring descriptor? This would require each core to have
>> a dual role, right?
>> - a virtio driver role on its TX vring
>> - a virtio device role on its RX vring."
>>
> I'm unsure if a dual role is feasible under the Virtio specification.

At least, it does not seem to align with the philosophy of VirtIO.


> However, would it make sense to set the size of the outbuf based on the
> Maximum Transmission Unit (MTU) size that is supported? Additionally,
> the size of the inbuf could be set by the firmware, suggesting that it
> should be derived from the resource table. With this approach, I believe
> the sender can decide the maximum size.

It is not clear to me what your proposal is.
Are you speaking about a pre-allocated buffers as proposed in [1],
or are you speaking about dynamic allocation of the RPMsg in a pool?
Regards,
Arnaud

> 
> Regards
> Divin
> 
>>
>> Regards,
>> Arnaud
>>
> 
>>
>>>
>>> We would greatly appreciate any feedback, suggestions, or improvements
>>> you could provide.
>>>
>>> Thank you for your time and consideration.
>>>
>>> Regards
>>> Divin
>>> IMPORTANT NOTICE: The contents of this email and any attachments are
>>> confidential and may also be privileged. If you are not the intended recipient,
>>> please notify the sender immediately and do not disclose the contents to any
>>> other person, use it for any purpose, or store or copy the information in any
>>> medium. Thank you.
> 
> IMPORTANT NOTICE: The contents of this email and any attachments are
> confidential and may also be privileged. If you are not the intended recipient,
> please notify the sender immediately and do not disclose the contents to any
> other person, use it for any purpose, or store or copy the information in any
> medium. Thank you.
