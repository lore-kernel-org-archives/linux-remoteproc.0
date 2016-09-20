Return-Path: <Matt.Redfearn@imgtec.com>
Subject: Re: [PATCH v2 5/6] remoteproc/MIPS: Add a remoteproc driver for MIPS
References: <1474361249-31064-1-git-send-email-matt.redfearn@imgtec.com>
 <1474361249-31064-6-git-send-email-matt.redfearn@imgtec.com>
 <alpine.DEB.2.20.1609201141120.6905@nanos>
From: Matt Redfearn <matt.redfearn@imgtec.com>
Message-ID: <95f3d60f-5d4d-aa6d-c94c-c21f717872d0@imgtec.com>
Date: Tue, 20 Sep 2016 16:31:51 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1609201141120.6905@nanos>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ralf Baechle <ralf@linux-mips.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, linux-mips@linux-mips.org, linux-remoteproc@vger.kernel.org, lisa.parratt@imgtec.com, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Thomas,


On 20/09/16 10:47, Thomas Gleixner wrote:
> On Tue, 20 Sep 2016, Matt Redfearn wrote:
>> +/* Intercept CPU hotplug events for syfs purposes */
>> +static int mips_rproc_callback(struct notifier_block *nfb, unsigned long action,
>> +			       void *hcpu)
>> +{
> Please convert to cpu hotplug state machine.

OK, I've done that for this and the MIPS GIC patch, using the dynamic 
CPUHP_AP_ONLINE_DYN state - I hope that is ok.

>
>> +	unsigned int cpu = (unsigned long)hcpu;
>> +
>> +	switch (action) {
>> +	case CPU_UP_PREPARE:
>> +	case CPU_DOWN_FAILED:
>> +		mips_rproc_device_unregister(cpu);
>> +		break;
>> +	case CPU_DOWN_PREPARE:
>> +		mips_rproc_device_register(cpu);
>> +		break;
>> +	}
> There is no reason why you need to setup the rproc device on
> DOWN_PREPARE. It's sufficient to do that when the CPU is dead, so you can
> use a symetric callback prep/dead.

Sure, the new state machine makes this much nicer registering the 
on/offline callbacks on one state.

>
>> +	/* Dynamically create mips-rproc class devices based on hotplug data */
>> +	get_online_cpus();
>> +	for_each_possible_cpu(cpu)
>> +		if (!cpu_online(cpu))
>> +			mips_rproc_device_register(cpu);
>> +	register_hotcpu_notifier(&mips_rproc_notifier);
>> +	put_online_cpus();
> Perhaps we should add support for "reverse" functionality to the state
> machine core. I'll have a look later how hard that'd be.

Yeah - I've had to work around the framework a little here since we 
require the opposite sense to the callbacks - activate the driver when 
the cpu is offlined and vice versa. In practice the only issue this gave 
me was that by default the framework invokes the teardown callback when 
the state is removed, so I used __cpuhp_remove_state() to avoid creating 
a remote processor device as the driver is being removed.

Thanks,
Matt

>
> Thanks,
>
> 	tglx
