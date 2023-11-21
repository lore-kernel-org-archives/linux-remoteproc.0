Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SGSLK5gO"
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FCEA0
	for <linux-remoteproc@vger.kernel.org>; Mon, 20 Nov 2023 21:54:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRYeweFkOjEAPMbXSZnnYR6gyjGqVhiJnjG31Pa4+UIvZQdBVC1F+FO5KqwIMdk/T5lWukOGcHwmGv7NdaWQ2E5ha6UVrnhYUxHdbzPiHgahcXEs0pHoB0U0f8TNoPc8T/JNGkJNu6deuVhLgqCN7lfH9PkdvnnfHn4rvenmj0GXvhPN1yOICC0fr4wyqt1mvZaA4oP2E5RSpJBWGgc52dO7MGxJGg/AwsZsxkeRTuHHvLz4tr6MteM3qZK6yPlM1VgJBh6t1AO5jk/UeGBZTvL+JREkBKlvlt2+uB7g13lerpK9UINHzlCtGed88UjCw4bKrCuXkmcNqqguG3dj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dffngQ+g9zf4222ihwRIzWI9qtYsQcY9yILd1cDudbo=;
 b=gLYXTXWda7WlgJVTNse/ZhEIs9rZQZ62vE0IR4sNuI34IyzYDP8uXAMJ8Y0RePRQuPC22cKFCeTuvZGHtR1h6e2nITuhsM4dKFvXqFQqnlagw4fqiCm0calkVfMiUMHn+iGfcB41o5mF7YRBFd6AK5OqwgCz85QIm7e6yfgJTmBAQ3qWYyzFqZoK8JNNkKKa1WgWrXnt2CM7wvgcHN5CGyY8ybDfCeFLDem6npwZWc+vRhQPGlJFcSWaAWgId69I3XHdtkWQ8o4X5GCmUfVmj704vFkd9op7oBUrxBj/N2iwamKfo0/IywQzdqNvOQV5EpbE0+q4viw4CdLX6k+OVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dffngQ+g9zf4222ihwRIzWI9qtYsQcY9yILd1cDudbo=;
 b=SGSLK5gOqxCmIstcr/DxRnJ7i0mWJcqfLwtIOpsE4p5NoDFB7XXoPxvQ1AYS0JejEc6zRNJqqghV6hw9dhuxZAQHCIXgtQX86bwmQQFgh5RyqvvoJeeSwnyksE8EvW8E5zqBz09AIctykjxzfiYmEIzOb5lVh12NBbMBFJHjzAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3683.namprd12.prod.outlook.com (2603:10b6:a03:1a5::16)
 by DM4PR12MB6184.namprd12.prod.outlook.com (2603:10b6:8:a6::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Tue, 21 Nov 2023 05:54:53 +0000
Received: from BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::dacc:66a0:6923:a5e]) by BY5PR12MB3683.namprd12.prod.outlook.com
 ([fe80::dacc:66a0:6923:a5e%4]) with mapi id 15.20.7002.028; Tue, 21 Nov 2023
 05:54:53 +0000
Message-ID: <8f5365cc-30cd-4641-98cf-e1861f2877e1@amd.com>
Date: Mon, 20 Nov 2023 23:54:50 -0600
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [Discussion]: Enhance virtio rpmsg bus driver buffer allocation
Content-Language: en-US
To: Divin Raj <divin.raj@arm.com>, linux-remoteproc@vger.kernel.org
References: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
 <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0031.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2d0::11) To BY5PR12MB3683.namprd12.prod.outlook.com
 (2603:10b6:a03:1a5::16)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB3683:EE_|DM4PR12MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: d6626599-c637-434c-fc9a-08dbea5661ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yiJEjYfEsMyft3J63N6xGPquTes1HJxi6w75C/Bc+uYQfrI6qxeFgKXf7TCUtEDbzWoiGQ2YeeVZ3E3TXBSoocb4KjtqEaMFnasFD74SudJaml6sjBTldRJUdeg+e+PPmBmFqa2bPnWHStoDnnBxa1wEKH4LiqWwGCNUwj80zkkSYUlM1kQhPOa6FsQr3wxkMtarty9yQeRlpq2jdt7TQK0ZM3MEaEMaUiP4lJwCRKyZQCm2wyWH7lldI3LHVNq6nuIWC1s1bfChtdeuOZlMRxIZAUhM4VqBLwxi8oWrDZZ1kp3yLm97fjRYu5bxPzWM/+8smBfv5JfqOW51R5PYiTwIM4XBeH8Udg18fQ4I8Zn5PTpPiQliU9OwJW3tVzwt4n0Hc26JTi9AmjL1vv+JV+PiH1gcCUng0GNl/DlUhIzOKmG0chBZ0kAusZWifJbUApweMoAS9hzz+onVsBOyuxA0Nwrm8qrYUtnUWLVbxTcVDGanvOE1Rt0jPc91N4ZRZKMNiN6tuMrtnQ+uFbAmKXalBzKg4o5ziTGCIsTVwUWRoMx/gOYWqFaQFjUuJR4SUiD3NT7xbPYVULTYCXStL0JSTrRgiUiEx4oGrY9c1J4eAZVl874Zd8dwkyZ9gE9WzoX8RRdLYbz80dQbjnYtGNdVjleNRNH2kdbMz/R7snIebhfly8z2+axINOUVPhXIVQM6dhRr66WMc8al/Tgd9ODvxeqyb31vGy4mc4cXk4I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB3683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(396003)(39860400002)(366004)(230173577357003)(230273577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(66899024)(66556008)(66476007)(66946007)(316002)(53546011)(36756003)(6512007)(6506007)(2616005)(26005)(478600001)(6486002)(38100700002)(31696002)(83380400001)(86362001)(44832011)(966005)(5660300002)(31686004)(2906002)(8676002)(8936002)(41300700001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3A2eFdWWXRlaE4rbytEditncWxiTEVUeXo2SnVPaEsxUk9ZYTBrRFhHZmhC?=
 =?utf-8?B?elhwdG92Znp6cXRQalI0bnJWaFpJOUFXRG5ldWM4aUJVdnpJa0ZueDlJRGdD?=
 =?utf-8?B?RUJ5ZVJ0U2RyRFZiUkJ5Qk54Z0xHd0VFWGlpaGVWdlY2TGV6a09sZWUzaFE4?=
 =?utf-8?B?MW5kNzRFYkFCQlc0TGg5OE9HeEhzeUdIUkQwS0FzSkhIY0krRVNIaWpOdGJz?=
 =?utf-8?B?TjFWZGZwdXRuQnozQmxDQlp2T051UldtMFdqV05Id2creWI3WHFjYnJ2NzZt?=
 =?utf-8?B?a0lpU3g5YVcyNVpXWGJhRDhwQmVsUUxvMTh5RmNGMDRLOTVENGFYNkpsTEp2?=
 =?utf-8?B?S2ZkYXpQNjNyOTJXK3RqU2lyWGZpOWJ2ZVJDeHZVYk9HeU44alpuY01UVUNp?=
 =?utf-8?B?WU5OYlBCTGpsT0ppKzZZQzk2SStCV0RiUjV6S2dsU2JGZS9QSHRVNXJ3SmVt?=
 =?utf-8?B?aVZVMWFUZkwrSUx0VGE5aVFsdHBiUTcwd0VHaDBVU3krdkZLaGNFd2Q0ZkxG?=
 =?utf-8?B?ZFJvcUVtYmhrY002M3QrMW00SWxEMGUyS0tFYmJWUW1qSlFFMXVxS1F4eldT?=
 =?utf-8?B?RHNKZ1NCOEcvSFpMekNVdHZPZG5uamExU0F4VzQrY05IV0Z0RkRHSGtDMUxr?=
 =?utf-8?B?VzdLZTQrS0t5ZmxTYVJzN3R5dkExcXFtQ093MUdrM0U3SHA2SmJBV204ekIw?=
 =?utf-8?B?OXlIRHQ5ZERRcGxLUUJYV2tsL2VQM2YzVk9rV1h0UGtkYVpIdDlqa0VKWms0?=
 =?utf-8?B?cU5YelJvSFJoUU9uUEtNYy9IRytDb1lrU1dpQUZlMS9TNm94ZWNaZlN2akJR?=
 =?utf-8?B?Uk5qM08va1ZNTkNtRXNrTmxTdkNHOGlZUWRCTGsvU01qemJhRzVaclhXemhZ?=
 =?utf-8?B?VWIvRjlGUGdWdDNFWTE4NWNXdXd6YnBya2grN2s4WGZYYmh2RUVZdlhaUldU?=
 =?utf-8?B?ME5qc3o2SktJRGF5NXdkeUN2VDdqYWRBS010MUt5OEpJcFlvQWJXVzBCcTg1?=
 =?utf-8?B?dGVnVFdnVzZLemt5YUJMb2liRHdCWnErT1I0Zmd6NUNRRHF4b0lEeVp2ZWt2?=
 =?utf-8?B?VVNnZWswSk5MK1ArdkRYZ2daZTU0SU5MREt0QnJhbHhtbldIVStETjk5Sm4z?=
 =?utf-8?B?NGo2ODJQUEl6VEZUbUJyRk84L2tYS1Y1VjFRQWdpRi82MVcrckd5M1d0M2Qr?=
 =?utf-8?B?MXhzd0s1Wjg2N0FXN1V0bjdaNmRnMFB2a25EQXpZZmphaXRneitjdkZJR0xF?=
 =?utf-8?B?ZXEvU2RpdzRVRlZWd2JZNDVTMWJKRFFVRmcxUmhGRDhZcmE0TUVTaGRBL1ky?=
 =?utf-8?B?QVJRMzY0eWRVVUdhakFMSG05c3JaS25DUXpWVXJtRDMvSStIS0JNQmhBTENS?=
 =?utf-8?B?SjdMbHlxNG1mQWgyK3JUek5KbTA5SmxibTlmbHBkWU5DTVRrTk95cUhiNWJq?=
 =?utf-8?B?bzRmQmZEa3RoVU5TejhWaWlWdk41bG1BSFlJb1ViQ0lCV0RTRHQxR0dQSmxi?=
 =?utf-8?B?QWZ6UkdPUjdCU29tMXZWWUp6c0lBWVVCTHNkdmw1NHAzQWsybysvWi9xVWFR?=
 =?utf-8?B?c2xLeHBzVTdLM2JmNlFERWl4cnRFS0VzVnpNa0R3U2pET2QweFFFWk0yV1NY?=
 =?utf-8?B?a2tZSjJWR3dLb0s5WnJIL0Y4Z3RDVVR2SEVqdVdOZFpsWTI5dTRUWjlRcXVZ?=
 =?utf-8?B?RENiRERWNVN5NUpsYXRuTDNXVGI5YlluUk1zM3VaUUk2WEVKUjV0MHdvUVR5?=
 =?utf-8?B?NGMxYTZCRUsvR096dnA2OUt6Y3hkelRPazRXdnhLOURZYXh3THlzeW01KzRK?=
 =?utf-8?B?d2JUazQ3VTZCWUk2a3Z5RGlkc25PYXJpRXVRdmUrR1dsb3VxOTQybjAvU05s?=
 =?utf-8?B?SDl6NXl1K00yT2hFNmFpQ1VJdTNIajhaSFpZbW44Njl1empzUWRLQkY5SFNQ?=
 =?utf-8?B?NlFNYkZvbWpjaEUxTjZabHhjekNiR1lHelZpNGYwTGVNY3hyYnhwZ3A2UWlL?=
 =?utf-8?B?dlJGL3A3R2djaUgwL2VmUVdhNXFQU2RBNG5UQ1V6Z3JtSlNENFZjcnlEUkk4?=
 =?utf-8?B?K25meFQyK3JMd2xrLzVQVG9GYnROMlFEV09yR2MvQjZraURvUk9QMEVCNUdB?=
 =?utf-8?Q?uZAHH0sbGBG0vOKs89JPGZjiA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6626599-c637-434c-fc9a-08dbea5661ac
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 05:54:53.1283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjpsAIMBDd/6KcM/vyeXBEUIy+YAdKBq531KFtPoY9oAftWpGfpzmQHNRq0sKgoV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6184

Hi Divin,

Please find my comments inline.

On 11/17/23 4:24 PM, Divin Raj wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> On 10/23/23 11:44 AM, Divin Raj wrote:
> > Hello all,
> >
> > I am reaching out with reference to the patch discussed here: Enhanced
> > virtio rpmsg bus driver buffer allocation.
> > <https://lore.kernel.org/all/CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zGtn1Qfo3mmBqVg@mail.gmail.com/>
> >
> > I've been keenly following the developments around enhancing buffer
> > allocation strategies, especially those focused on dynamic buffer sizing
> > and the considerations for systems under varying memory constraints.This
> > work is highly relevant to several projects I am involved in, and I am
> > quite interested in its progression. May I kindly request an update on
> > the current phase of these initiatives? Additionally, I am eager to know
> > if there would be an opportunity for me to contribute to enhancing the
> > patch, possibly by working on improvements or assisting in verification
> > processes.
> >
> > Furthermore, if there are any condensed resources, summaries, or
> > specific threads that encapsulate recent advancements or discussions on
> > this topic, I would be grateful to receive directions to them.
> >
> > I appreciate everyone's dedicated efforts and invaluable contributions
> > to this area of development. Looking forward to the updates.
> >
> > Regards Divin
> >
> Hello Linux Community,
>
> In one of our internal projects, we encountered a challenge with RPMSG
> buffer allocation. Our goal is to optimize memory allocation for an
> out-of-tree RPMSG Ethernet device driver using virtio. This is to ensure
> support for packet sizes matching the standard MTU (Maximum Transmission
> Unit) size of 1500 bytes.
>
> To mitigate this issue, There are few possible solutions:
>
> 1. Configure buffer size and number through Kconfig.

This has been posted multiple times on mailing list, but really doesn't solve the problem.


> 2. Permit the firmware creator to determine the most suitable value from
>    the resource table.

This could be one of the solution, but if we can achieve dynamic allocation (below 3) we prefer that.


> 3. Enable independent configurations on both ends. This approach would
> support both dynamic and fixed buffer configurations using a generic
> allocator.
>
> Reference:
>
> [1]:
> https://lore.kernel.org/all/1548949280-31794-4-git-send-email-xiaoxiang@xiaomi.com/
> [2]: https://lore.kernel.org/all/20190701061353.GE1263@builder/
>
We can use above patch to start with. I did not have chance to look at above yet, but we had

discussed it before and seems like a good solution.


> Draft Design Overview:
>
> Based on the reference patch and the discussions, we have outlined the
> following key points for the belw design:
>
> 1. Assure compatibility, enabling both Linux and the remote system to
> interchangeably transmit and receive messages, irrespective of size.
> 2. For systems with constrained shared memory:
> Systems with small, shared memory, we need to deal with a
> limited/optimized memory chunk. To avoid memory fragmentation, the
> allocator should have a pre-reserved buffer pool
> 3. The implementation should ensure that the remote side does not
> receive messages based on its allocation parameters.
>
> do you think it could make sense?
>
> High level view:
> +------------------+                               +------------------+
> |                  |                               |                  |
> |      Linux       |                               |      Remote      |
> |                  |                               |                  |
> |   +----------+   |       +-----------------+     |   +----------+   |
> |   |   RPMSG  |   | <---> | Buffer Allocator|<--->|   | RPMSG    |   |
> |   +----------+   |       | (Dynamic/Static)|     |   +----------+   |
> |                  |       +-----------------+     |                  |
> +------------------+                               +------------------+
>
>
> Detailed view:
>
>                    +-------------------------+
>                    |  Message Creation       |
>                    |  (Both Linux/Remote)    |
>                    +------------+------------+
>                                 |
>                                 v
>                    +-------------------------+
>                    | Determine the allocation|
>                    | strategy                |
>                    +------------+------------+
>                                 |
>                  +--------------+--------------+
>                  |                             |
> +-------------------------------+  +-------------------------------+
> | Dynamic allocation            |  | Static allocation             |
> | (Buffer allocator allocates   |  | (Pre-reserved memory          |
> | memory space as needed,       |  | space)                        |
> | based on the current          |  |                               |
> | message requirement )         |  |                               |
> +-------------------------------+  +-------------------------------+
>
> We would greatly appreciate any feedback, suggestions, or improvements
> you could provide.
>
> Thank you for your time and consideration.
>
> Regards
> Divin
> IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium. Thank you.

When working with upstream list, could you try to remove above footer please ?


